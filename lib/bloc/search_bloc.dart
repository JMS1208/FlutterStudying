import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

import '../repository/search_repository.dart';

class SearchBloc extends Bloc<SearchBlocEvents, List<String>> {
  final SearchRepository _searchRepository;

  SearchBloc(this._searchRepository) : super([]) {
    on<SearchEvent>((event, emit) async {
      var result = await _searchRepository.search(event.key);
      emit(result);
    }, transformer: (events, mapper) => events
                .debounceTime(Duration(milliseconds: 1000))
                .flatMap(mapper));
  }

  @override
  void onChange(Change<List<String>> change) {
    super.onChange(change);
    print(change);
  }
}

abstract class SearchBlocEvents extends Equatable {}

class SearchEvent extends SearchBlocEvents {
  final String key;

  SearchEvent(this.key);

  @override
  List<Object?> get props => [];
}
