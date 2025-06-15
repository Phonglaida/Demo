package com.example.Backend.Service;

import com.example.Backend.Entity.Orders;

import java.util.List;
import java.util.Optional;

public interface OrdersService {
    List<Orders> findAll();
    Optional<Orders> findById(Integer id);
    Orders save(Orders order);
    void deleteById(Integer id);
}
