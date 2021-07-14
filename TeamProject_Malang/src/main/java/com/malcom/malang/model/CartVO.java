package com.malcom.malang.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartVO {

	private Long cr_code;//	BIGINT	PRIMARY KEY,
	private String cr_buyerid;//	VARCHAR(20)	NOT NULL,
	private String cr_itcode;//	CHAR(8)	NOT NULL,
	private String cr_option;//	VARCHAR(256) NOT NULL,
	private int cr_price = 0;//	INT NOT NULL,
	private int cr_amount = 0;//	INT DEFAULT 1,
	private int cr_shippingfee = 0;//	INT NOT NULL
}