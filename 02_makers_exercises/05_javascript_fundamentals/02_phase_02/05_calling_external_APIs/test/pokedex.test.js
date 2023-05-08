const { Pokedex } = require('../lib/pokedex');
const { fetchPokemon } = require('../lib/api');

describe(Pokedex, () => {
  it("should initially return an empty array", () => {
    const pokedex = new Pokedex;
    expect(pokedex.all()).toEqual([])
  });
  it("can add new pokemon to the pokedex", async () => {
    const pokedex = new Pokedex();
    await pokedex.catch("pikachu")
    expect(pokedex.all()[0].name).toStrictEqual("pikachu");
  })
  it("can add new pokemon to the pokedex", async () => {
    const pokedex = new Pokedex();
    await pokedex.catch("pikachu");
    expect(pokedex.all()[0].name).toStrictEqual("pikachu");
  })
  it("can add multiple pokemon to the pokedex", async () => {
    const pokedex = new Pokedex();
    await pokedex.catch("pikachu");
    await pokedex.catch("charizard");
    expect(pokedex.all()[0].name).toStrictEqual("pikachu");
    expect(pokedex.all()[1].name).toStrictEqual("charizard");
  })
});