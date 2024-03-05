package com.poly.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "discount")
public class Discount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer categoryId;

    @NotNull(message = "Ngày bắt đầu không được để trống")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDay;

    @NotNull(message = "Ngày kết thúc không được để trống")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDay;

    @NotBlank(message = "Số lượng không được để trống")
    private String quantity;

    @NotBlank(message = "Trạng thái không được để trống")
    private String status;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Products products;
}

