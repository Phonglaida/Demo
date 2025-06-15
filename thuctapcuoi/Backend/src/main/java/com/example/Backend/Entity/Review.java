package com.example.Backend.Entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;


@Entity
@Table(name = "review")
public class Review {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private User customer;

    private Integer rating;

    @Column(columnDefinition = "TEXT")
    private String reviewContent;

    private LocalDateTime createdAt;

    // Getters and Setters
}


