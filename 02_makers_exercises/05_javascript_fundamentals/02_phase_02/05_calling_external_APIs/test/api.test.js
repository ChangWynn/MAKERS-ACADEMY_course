const {fetchPokemon} = require('../lib/api');

describe(fetchPokemon, () => {
  it("can fetch the data for pikachu using done", (done) => {
    fetchPokemon('pikachu').then((pokemon) => {
      expect(pokemon.name).toEqual('pikachu');
      done();
    })
  })
  it("can fetch the data for charizard using return", () => {
    return fetchPokemon('charizard').then((pokemon) => {
      expect(pokemon.name).toEqual('charizard')
    })
  })

  it("can fetch the data for mewtwo usinc await", async () => {
    const pokemon = await fetchPokemon('mewtwo');
    expect(pokemon.name).toEqual("mewtwo");
  })
})