package ru.alexking.store;

import java.util.List;

public interface Storage<T> {

    List<T> values();

    int add(final T obj);
    
    void edit(final T obj);

    void delete(final int id);

    T get(final int id);
}
