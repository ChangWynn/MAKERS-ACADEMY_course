const fetchPokemon = (pokemon) => {
  return fetch(`https://pokeapi.co/api/v2/pokemon/${pokemon}`)
    .then(response => response.json())
    .then(data => {
      return {
        name: data.forms[0].name,
        id: data.id,
        height: data.height,
        weight: data.weight,
        types: data.types.map(obj => obj.type.name),
      };
    });
};

// fetchPokemon('pikachu').then((pokemon) => console.log(pokemon))

module.exports = { fetchPokemon };





