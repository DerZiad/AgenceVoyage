package ma.wiebatouta.models;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "hotels")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Hotel implements Serializable, Comparable<Hotel> {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "nombreetoiles", nullable = false)
	@NotNull(message = "Le nombre d'étoile ne doit pas être vide")
	@Range (min = 1, max = 5, message = "Le nombre d'étoile doit être entre 1 et 5")
	private Integer nombreEtoile;
	@Column(name = "nomhotel", nullable = false)
	@NotNull(message = "Le nombre d'étoile ne doit pas être vide")
	@Length(min = 1, max = 30, message = "Le nom d'Hotel doit être entre 1 et 30 caractères")
	private String nomHotel;
	@Column(name = "ville", nullable = false)
	@NotNull(message = "Le nom de la ville ne doit pas être vide")
	@Length(min = 1, max = 30, message = "Le nom de la ville doit être entre 1 et 30")
	private String ville;

	/**
	 * Voyages
	 * */
	@ManyToMany(cascade = {CascadeType.PERSIST,CascadeType.REFRESH,CascadeType.MERGE,CascadeType.DETACH})
	@JsonIgnore
	private List<Voyage> voyages = new ArrayList<Voyage>();
	
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "hotel",fetch = FetchType.LAZY,targetEntity = Picture.class)
	private List<Picture> pictures = new ArrayList<Picture>();
	
	@Override
	public int compareTo(Hotel o) {
		return nomHotel.compareTo(nomHotel);
	}

	public Hotel(int nombreEtoile, String nomHotel, String ville) {
		super();
		this.nombreEtoile = nombreEtoile;
		this.nomHotel = nomHotel;
		this.ville = ville;
	}

}
