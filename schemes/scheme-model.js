const db = require("../data/dbConfig.js");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find() {
    return db("schemes");
}

function findById(id) {
    return db("schemes").where({ id: id }).first();
}

function findSteps(id) {
    return db("schemes")
        .join("steps", "steps.scheme_id", "schemes.id")
        .select("steps.id", "scheme_name", "step_number", "instructions")
        .where({ scheme_id: id })
        .orderBy("step_number")
}

function add(scheme) {
    return db("schemes")
        .insert(scheme)
        .then(ids => {
            return findById(ids[0]);
        });
}

function addStep(step, scheme_id) {
    return db("steps")
        .insert({...step, scheme_id: scheme_id})
        .then(ids => {
            return findSteps(scheme_id)
                .then(steps => {
                    return steps.filter(step => step.id === ids[0])[0];
                });
        });
}

function update(changes, id) {
    return db("schemes")
        .where({ id: id })
        .update(changes)
        .then(() => {
            return findById(id);
        });
}

function remove(id) {
    return db("schemes").where({ id: id }).del();
}
