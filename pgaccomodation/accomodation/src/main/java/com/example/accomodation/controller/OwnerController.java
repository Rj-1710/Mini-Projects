package com.example.accomodation.controller;

import com.example.accomodation.model.Owner;
import com.example.accomodation.model.PgPlace;
import com.example.accomodation.service.OwnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/owner")
public class OwnerController {

    @Autowired
    private OwnerService ownerService;

    /**
     * Registers a new owner.
     *
     * @param owner the owner details to register
     * @return the registered Owner entity
     */
    @PostMapping("/register")
    public ResponseEntity<Owner> registerOwner(@RequestBody Owner owner) {
        return ResponseEntity.ok(ownerService.registerOwner(owner));
    }

    /**
     * Adds a new PG place for a specific owner.
     *
     * @param place   the PG place details
     * @param ownerId the ID of the owner to associate the place with
     * @return the created PgPlace entity
     */
    @PostMapping("/places/add/{ownerId}")
    public ResponseEntity<PgPlace> addPlace(@RequestBody PgPlace place, @PathVariable Long ownerId) {
        return ResponseEntity.ok(ownerService.addPlace(place, ownerId));
    }

    /**
     * Retrieves all PG places added by a specific owner.
     *
     * @param ownerId the ID of the owner
     * @return list of PG places belonging to the owner
     */
    @GetMapping("/places")
    public ResponseEntity<List<PgPlace>> getAllPlaces(@RequestParam Long ownerId) {
        return ResponseEntity.ok(ownerService.getAllPlacesByOwner(ownerId));
    }

    /**
     * Changes the availability status of a PG place.
     *
     * @param id the ID of the PG place
     * @return the updated PgPlace entity with new status
     */
    @PatchMapping("/places/{id}")
    public ResponseEntity<PgPlace> changeStatus(@PathVariable Long id) {
        return ResponseEntity.ok(ownerService.changeStatus(id));
    }

    /**
     * Edits the details of an existing PG place.
     *
     * @param place the updated PG place details
     * @return the updated PgPlace entity
     */
    @PutMapping("/places/edit")
    public ResponseEntity<PgPlace> editPlace(@RequestBody PgPlace place) {
        return ResponseEntity.ok(ownerService.editPlace(place));
    }

    /**
     * Deletes a PG place by its ID.
     *
     * @param id the ID of the PG place to delete
     * @return confirmation message of deletion
     */
    @DeleteMapping("/places/delete")
    public ResponseEntity<String> deletePlace(@RequestParam Long id) {
        ownerService.deletePlace(id);
        return ResponseEntity.ok("Place deleted successfully");
    }
}
