package com.example.accomodation.service;

import java.util.List;

import com.example.accomodation.model.Owner;
import com.example.accomodation.model.PgPlace;

public interface PgServiceInterface {
	
	public List<PgPlace> getPlacesByCity(String city);
	public List<PgPlace> getPlacesByLocality(String locality);
	public PgPlace getPgDetails(Long id);
	public Owner getOwnerDetails(Long placeId);

}
