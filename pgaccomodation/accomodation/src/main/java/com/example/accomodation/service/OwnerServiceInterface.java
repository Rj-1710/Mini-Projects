package com.example.accomodation.service;

import java.util.List;

import com.example.accomodation.model.Owner;
import com.example.accomodation.model.PgPlace;

public interface OwnerServiceInterface {
	
	public PgPlace addPlace(PgPlace place, Long ownerId);
	public List<PgPlace> getAllPlacesByOwner(Long ownerId);
	public PgPlace changeStatus(Long id);
	public PgPlace editPlace(PgPlace updatedPlace);
	public void deletePlace(Long id);
	public Owner registerOwner(Owner owner);
}
