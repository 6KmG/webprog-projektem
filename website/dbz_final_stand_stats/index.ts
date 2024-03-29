function capitalize(str: string): string {
    return str.charAt(0).toUpperCase() + str.slice(1);
}

class Player {
    protected static RACE_STATS: { [key: string]: number } = {
        android: 1,
        saiyan: 1 / 3,
        human: 1 / 2,
        majin: 1 / 2,
        frieza: 1 / 2,
        namekian: 1 / 2,
        jiren: 1 / 2,
    };
    protected static RACES: string[] = Object.keys(Player.RACE_STATS);
    protected static MIN_DEATH_LVL: number = 602;
    protected static MIN_PRESTIGE_LVL: number = 432;

    public level: number;
    public melee_stat: number;
    public other_stat: number;
    public race: string;
    public name: string;
    public rebirthed: boolean;
    public dead: boolean;
    public prestiges: number;

    private checkErrors(): void {
        if (this.level > 2000) {
            window.alert("The level cap is 2000.");
            location.reload();
        }
        if (this.level < 1) {
            window.alert("The minimum level is 1.");
            location.reload();
        }
        if (this.melee_stat > 5400 || this.other_stat > 2875) {
            window.alert("CHEATER!!");
            location.reload();
        }
    }

    protected init (        
        race: string,
        level: number = 1,
        melee_stat: number = 0,
        other_stat: number = 0,
        name: string = "Player_Name",
        _prestiges: number = 0,
        _rebirthed: boolean = false
    ): void {
        race = race.toLowerCase();
        if (!Player.RACES.includes(race)) {
            window.alert("The given race is incorrect.");
            location.reload();
        }
        this.level = Math.round(level);
        this.melee_stat = Math.round(melee_stat) + 2;
        this.other_stat = Math.round(other_stat);
        this.race = race;
        this.name = name;
        this.rebirthed = _rebirthed;
        this.dead = false;
        this.prestiges = _prestiges;
        this.checkErrors();
    }

    constructor(
        race: string,
        level: number = 1,
        melee_stat: number = 0,
        other_stat: number = 0,
        name: string = "Player_Name",
        _prestiges: number = 0,
        _rebirthed: boolean = false
    ) {
        race = race.toLowerCase();
        if (!Player.RACES.includes(race)) {
            window.alert("The given race is incorrect.");
            location.reload()
        }
        this.level = Math.round(level);
        this.melee_stat = Math.round(melee_stat) + 2;
        this.other_stat = Math.round(other_stat);
        this.race = race;
        this.name = name;
        this.rebirthed = _rebirthed;
        this.dead = false;
        this.prestiges = _prestiges;
        this.checkErrors();
    }

    public formatStats(): string {
        let text: string = '';
        text += `<div class="lines">${"Name"} <div class="points">${this.name}</div></div>`;
        text += `<div class="lines">${"Race"} <div class="points">${capitalize(this.race)}</div></div>`;
        text += `<div class="lines">${"Level"} <div class="points">${this.level.toString()}</div></div>`;
        text += `<div class="lines">${"Health Max"} <div class="points">${this.other_stat.toString()}</div></div>`;
        text += `<div class="lines">${"Ki Max"} <div class="points">${this.other_stat.toString()}</div></div>`;
        text += `<div class="lines">${"Melee Damage"} <div class="points">${this.melee_stat.toString()}</div></div>`;
        text += `<div class="lines">${"Ki Damage"} <div class="points">${this.other_stat.toString()}</div></div>`;
        text += `<div class="lines">${"Melee Resistance"} <div class="points">${this.other_stat.toString()}</div></div>`;
        text += `<div class="lines">${"Ki Resistance"} <div class="points">${this.other_stat.toString()}</div></div>`;
        text += `<div class="lines">${"Speed"} <div class="points">${this.other_stat.toString()}</div></div>`;
        return text;
    }

    public kamiBoost(): void {
        if (this.race !== "namekian") {
            window.alert("You're not a namekian, therefore you can't use this boost.");
            location.reload();
        }
        this.melee_stat += 20;
    }

    public nailBoost(): void {
        this.kamiBoost();
    }

    public showNpcStatBoost(): void {
        let multiplier: number = 1;
        for (let i = 0; i < this.prestiges; i++) {
            multiplier += multiplier * 0.1;
        }
        console.log(`The npcs have a ${Math.floor((multiplier - 1) * 100)}% stat boost against you.`);
    }

    public levelUp(levels: number): void {
        this.level += levels;
        this.checkErrors();
        if (this.dead) {
            this.other_stat += Math.round(levels);
            this.melee_stat += Math.round(levels * 2);
        } else {
            this.other_stat += Math.round(levels * Player.RACE_STATS[this.race]);
            this.melee_stat += Math.round(levels * Player.RACE_STATS[this.race]) + levels;
        }
    }

    public levelDown(levels: number): void {
        this.level -= levels;
        this.checkErrors();
        if (this.dead) {
            if (levels < 0) {
                window.alert("You're levelling down while being dead, this will cause inconsistencies in your stats.");
                location.reload();
            }
            this.other_stat -= Math.round(levels);
            this.melee_stat -= Math.round(levels * 2);
        } else {
            this.other_stat -= Math.round(levels * Player.RACE_STATS[this.race]);
            this.melee_stat -= Math.round(levels * Player.RACE_STATS[this.race]) + levels;
        }
    }

    public setLevel(level: number): void {
        const difference: number = level - this.level;
        this.level = level; 
        this.checkErrors();
        if (this.dead) {
            if (difference < 0) {
                window.alert("You're levelling down while being dead, this will cause inconsistencies in your stats");
                location.reload();
            }
            this.other_stat += Math.round(difference);
            this.melee_stat += Math.round(difference * 2);
        } else {
            this.other_stat += Math.round(difference * Player.RACE_STATS[this.race]);
            this.melee_stat += Math.round(difference * Player.RACE_STATS[this.race]) + difference;
        }
    }

    public wishDeath(): void {
        if (Player.MIN_DEATH_LVL > this.level || this.rebirthed) {
            window.alert("The lowest level, when you can wish death is 602.");
            location.reload();
        } else {
            this.dead = true;
        }
    }
    
    public rebirth(): void {
        if (this.dead && this.level >= 850) {
            this.init(
                this.race,
                this.level = 1,
                this.melee_stat / 10 + 300,
                this.other_stat / 10 + 300,
                this.name,
                this.prestiges,
                true
            );
        } else {
            window.alert("You can't rebirth below level 850.");
            location.reload();
        }
    }

    public prestige(): void {
        if (Player.MIN_PRESTIGE_LVL > this.level) {
            window.alert("Your level is not high enough to prestige.");
            location.reload();
        }
        if (this.rebirthed) {
            this.init(
                this.race,
                this.level = 1,
                this.melee_stat / 5 + 300,
                this.other_stat / 5 + 300,
                this.name,
                this.prestiges + 1,
                this.rebirthed
            );
        } else {
            this.init(
                this.race,
                this.level = 1,
                this.melee_stat / 5,
                this.other_stat / 5,
                this.name,
                this.prestiges + 1,
                this.rebirthed
            );
        }
    }
}

let player: Player = new Player("Android");

function displayStats(){
    const object = document.getElementById("stats")
    if(object){
        object.innerHTML=player.formatStats();
    }
}

function newPlayer(race: string){
    player = new Player(race);
    displayStats();
}

function setLevel(){
    const level = document.getElementById("setlevelinput").value;
    if(isNaN(level) || level == ''){
        window.alert("NaN");
        return;
    }
    player.setLevel(level);
    player.levelUp(10);
    displayStats();
}

function levelUp(){
    const level = document.getElementById("levelupinput").value;
    if(isNaN(level) || level == ''){
        window.alert("NaN");
        return;
    }
    player.levelUp(level);
    displayStats();
    window.alert(player.level);
}

function levelDown(){
    const level = document.getElementById("leveldowninput").value;
    if(isNaN(level) || level == ''){
        window.alert("NaN");
        return;
    }
    player.levelDown(level);
    displayStats();
}

// const player: Player = new Player("AndroId");
// player.setLevel(602);
// document.write(player.formatStats());
// player.wishDeath();
// player.setLevel(2000);
// //document.write(player.formatStats());
// player.rebirth();
// const num_of_prestiges: number = 5;
// const melee_stats: number[] = [player.melee_stat];
// const other_stats: number[] = [player.other_stat];
// for (let i = 0; i < num_of_prestiges; i++) {
//     player.setLevel(2000);
//     console.log(`Prestiges: ${player.prestiges}`);

//     player.prestige();
// }
// player.setLevel(2000);



