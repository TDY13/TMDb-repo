import Foundation

struct Movie : Codable {
	let genreIds : [Int]?
	let originalLanguage : String?
	let originalTitle : String?
	let posterPath : String?
	let video : Bool?
	let voteAverage : Double?
	let voteCount : Int?
	let overview : String?
	let releaseDate : String?
	let title : String?
	let id : Int?
	let adult : Bool?
	let backdropPath : String?
	let popularity : Double?
	let mediaType : String?

	enum CodingKeys: String, CodingKey {

		case genreIds = "genre_ids"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case posterPath = "poster_path"
		case video = "video"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
		case overview = "overview"
		case releaseDate = "release_date"
		case title = "title"
		case id = "id"
		case adult = "adult"
		case backdropPath = "backdrop_path"
		case popularity = "popularity"
		case mediaType = "media_type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        genreIds = try values.decodeIfPresent([Int].self, forKey: .genreIds)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalTitle)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
		video = try values.decodeIfPresent(Bool.self, forKey: .video)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
		overview = try values.decodeIfPresent(String.self, forKey: .overview)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
		popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
		mediaType = try values.decodeIfPresent(String.self, forKey: .mediaType)
	}

}
