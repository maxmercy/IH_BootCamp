var fs = require('fs')

function prettyFormat(episode) {
  console.log("Title: " + episode.title
  + "  Episode #: " + episode.episode_number + "\n"
  + episode.description + "\nRating: "
  + episode.rating + " " + generateStars(episode.rating))
}

function generateStars(rating){
  return "*".repeat(rating)
}

function highRating(episode) {
  return episode.rating >= 8.5
}

function episodeNumber(a, b) {
  return a.episode_number - b.episode_number
}

function searchFor(hero, episodes) {
  episodes.forEach(function(episode) {
    var found = episode.description.indexOf(hero)
    if (found > -1) {
      console.log(hero + " found in episode #" + episode.episode_number)
    }
  })
}

function fileActions(err, file){
    if (err) {
        throw err;
    }
    var episodes = JSON.parse(file);
    // console.log(episodes[0]);

    episodes
    .filter(highRating)
    .sort(episodeNumber)
    .forEach(prettyFormat) // Note: forEach slower than for

    console.log("#".repeat(20)) // separator

    searchFor("Drogo", episodes) // challenge mode
    searchFor("Jon", episodes) // challenge mode
}

fs.readFile("./GoTEpisodes.json", 'utf8', fileActions)c
