import {DataTypes, Model} from 'sequelize';
import util from 'util';
import connectToDB from './db.js';

const db = await connectToDB('postgresql:///animals');

export class Human extends Model {
    [util.inspect.custom]() {
        return this.toJSON();
    }

    getFullName() {
        return `${this.fname} ${this.lname}`;
    }
}

Human.init({
        humanId: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            allowNull: false,
            primaryKey: true
        },
        fname: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        lname: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        email: {
            type: DataTypes.STRING,
            allowNull: false
        },
    },
    {
        modelName: 'human',
        sequelize: db,
    },
);

export class Animal extends Model {
    [util.inspect.custom]() {
        return this.toJSON();
    }
}

Animal.init({
        animalId: {
            type: DataTypes.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        name: {
            type: DataTypes.STRING,
            allowNull: false,
        },
        species: {
            type: DataTypes.STRING,
            allowNull: false
        },
        birthYear: {
            type: DataTypes.STRING
        }
    },
    {
        modelName: 'animal',
        sequelize: db,
    },
);

Human.hasMany(Animal, {foreignKey: 'humanId'});
Animal.belongsTo(Human, {foreignKey: 'humanId'});

export default db;
