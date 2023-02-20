const EventEmitter = require("events")

const eventEmitter = new EventEmitter();
eventEmitter.on('sort',(array)=>{
    array.sort();
    console.log(array)
})
const friends =['Clark','Lois','Pete','Lana','Chloe'];
eventEmitter.emit('sort',friends);

eventEmitter.on('search',(term,array)=>{
    for(let i in array) if (array[i]===term ) return console.log(`Found term '${term}' at ${i}`) ;
    console.log(`Term '${term}' not found`);
})

eventEmitter.emit('search','Clark',friends);
eventEmitter.emit('search','Lex',friends);
