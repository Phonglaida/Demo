package com.example.Backend.Entity;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "Orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderId;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private User customer;

    private LocalDateTime orderDate;
    private String customerName;

    @Column(columnDefinition = "TEXT")
    private String address;

    private String city;
    private String district;
    private String province;
    private String settleType;
    private String phone;
    private BigDecimal totalOrderValue;
    private String orderStatus;


    @OneToOne(mappedBy = "order", cascade = CascadeType.ALL)
    private Payment payment;
}

