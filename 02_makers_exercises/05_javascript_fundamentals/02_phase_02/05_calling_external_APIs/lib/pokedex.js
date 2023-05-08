const { fetchPokemon } = require("./api")

class Pokedex {
  constructor() {
    this.pokedex = []
  }

  all() {
    return this.pokedex
  }

  async catch(pokemon) {
    const pokemonObj = await fetchPokemon(pokemon);
    this.pokedex.push(pokemonObj)
  };

}

module.exports = { Pokedex }