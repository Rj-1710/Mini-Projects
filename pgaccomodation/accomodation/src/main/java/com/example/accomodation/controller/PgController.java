package com.example.accomodation.controller;

import com.example.accomodation.model.PgPlace;
import com.example.accomodation.service.PgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/pg")
public class PgController {

    @Autowired
    private PgService pgService;

    /**
     * Retrieves available PG places in a specific city.
     *
     * @param city the name of the city
     * @return list of PG places available in the given city
     */
    @GetMapping("/city/{city}")
    public ResponseEntity<List<PgPlace>> getPgByCity(@PathVariable String city) {
        return ResponseEntity.ok(pgService.getPlacesByCity(city));
    }

    /**
     * Lists available PG places in a specific locality.
     *
     * @param locality the name of the locality
     * @return list of PG places available in the given locality
     */
    @GetMapping("/{locality}")
    public ResponseEntity<List<PgPlace>> getPgByLocality(@PathVariable String locality) {
        return ResponseEntity.ok(pgService.getPlacesByLocality(locality));
    }

    /**
     * Retrieves details of a specific PG place by its ID.
     *
     * @param id the ID of the PG place
     * @return the PgPlace entity with detailed information
     */
    @GetMapping("/details/{id}")
    public ResponseEntity<PgPlace> getPgDetails(@PathVariable Long id) {
        return ResponseEntity.ok(pgService.getPgDetails(id));
    }

    /**
     * Retrieves the details of owner of a specific PG place.
     * The service layer handles logic such as throwing exceptions if the PG is occupied.
     *
     * @param id the ID of the PG place
     * @return owner details associated with the PG place
     */
    @GetMapping("/owner/{id}")
    public ResponseEntity<?> getOwnerDetails(@PathVariable Long id) {
        return ResponseEntity.ok(pgService.getOwnerDetails(id));
    }
}
