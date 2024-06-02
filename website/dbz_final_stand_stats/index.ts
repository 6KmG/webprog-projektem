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

    protected kamiBoosted = false;
    protected nailBoosted = false;

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

    constructor (
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
        if(this.kamiBoosted){
            window.alert("You can't use this boost anymore.");
            location.reload();
        }
        if (this.race !== "namekian") {
            window.alert("You're not a namekian, therefore you can't use this boost.");
            location.reload();
        }
        this.kamiBoosted = true;
        this.melee_stat += 20;
    }

    public nailBoost(): void {
        if(this.nailBoosted){
            window.alert("You can't use this boost anymore.");
            location.reload();
        }
        if (this.race !== "namekian") {
            window.alert("You're not a namekian, therefore you can't use this boost.");
            location.reload();
        }
        this.nailBoosted = true;
        this.melee_stat += 20;
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
        if (Player.MIN_DEATH_LVL > this.level) {
            window.alert("The lowest level, when you can wish death is 602.");
            location.reload();
        }
        if (this.rebirthed){
            window.alert("You have already rebirthed, you can't die again.");
            location.reload();
        }
        this.dead = true;
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
            if (this.race == "namekian") {
                this.kamiBoosted = false;
                this.nailBoosted = false;
            }
        } 
        else if(!this.dead){
            window.alert("You haven't died yet.");
            location.reload();
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
        if(this.dead){
            window.alert("You can't prestige while you're dead.");
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

let player: Player = new Player("namekian");

function displayStats(){
    const object = document.getElementById("stats")
    if(object){
        object.innerHTML = player.formatStats();
    }
}

function kamiButton(visibility: string){
    let object = document.getElementById("kamiboostbtn");
    if(object){
        object.style.visibility = visibility;
    }
    object = document.getElementById("kamiboost");
    if(object){
        object.innerHTML = "You have already used you Kami Boost.";
    }
}

function nailButton(visibility: string){
    let object = document.getElementById("nailboostbtn");
    if(object){
        object.style.visibility = visibility;
    }
    object = document.getElementById("nailboost");
    if(object){
        object.innerHTML = "You have already used you Nail Boost.";
    }
}

function namekianBoost(visibility: string){
    let objects = [];
    objects[1] = document.getElementById("kamiboost");
    objects[2] = document.getElementById("nailboost");
    objects[3] = document.getElementById("kamiboostbtn");
    objects[4] = document.getElementById("nailboostbtn");
    for (let i = 0; i < objects.length; i++){
        if (objects[i]){
            objects[i].style.visibility = visibility;
        }
    }
    if(objects[1]) objects[1].innerHTML = "You haven't used you Kami Boost.";
    if(objects[2]) objects[2].innerHTML = "You haven't used you Nail Boost.";
}

function undo(race: string){
    if(race != "namekian"){
        namekianBoost("hidden");
    }
    else{
        namekianBoost("visible");
    }
    let objects = [];
    objects[1] = document.getElementById("heaven");
    objects[2] = document.getElementById("rebirthed");
    objects[3] = document.getElementById("rebirthbutton");
    objects[4] = document.getElementById("deathbutton");
    objects[5] = document.getElementById("npcboost");
    objects[6] = document.getElementById("prestiges");
    if(objects[1]) objects[1].innerHTML = "You're not in heaven.";
    if(objects[2]) objects[2].innerHTML = "You haven't rebirthed yet.";
    if(objects[3]) objects[3].style.visibility = "visible";
    if(objects[4]) objects[4].style.visibility = "visible";
    if(objects[5]) objects[5].innerHTML = `NPCs have a 0% stat boost against you.`;
    if(objects[6]) objects[6].innerHTML = `Prestiges: 0`;
}

function newPlayer(race: string){
    undo(race);
    player = new Player(race);
    displayStats();
}

function setLevel(){
    let level = document.getElementById("setlevelinput").value;
    level = Number(level);
    if(isNaN(level) || level == ''){
        window.alert("NaN");
        return;
    }
    player.setLevel(level);
    displayStats();
}

function levelUp(){
    let level = document.getElementById("levelupinput").value;
    level = Number(level);
    if(isNaN(level) || level == ''){
        window.alert("NaN");
        return;
    }
    player.levelUp(level);
    displayStats();
}

function levelDown(){
    let level = document.getElementById("leveldowninput").value;
    level = Number(level);
    if(isNaN(level) || level == ''){
        window.alert("NaN");
        return;
    }
    player.levelDown(level);
    displayStats();
}

function wishDeath(){
    player.wishDeath();
    displayStats();
    let object = document.getElementById("heaven");
    if(object) object.innerHTML = "Now you're in heaven.";
    object = document.getElementById("deathbutton");
    if(object) object.style.visibility = "hidden";
}

function rebirth(){
    player.rebirth();
    if (player.race == "namekian"){
        namekianBoost("visible");
    }
    displayStats();
    let objects = [];
    objects[1] = document.getElementById("heaven");
    objects[2] = document.getElementById("rebirthed");
    objects[3] = document.getElementById("rebirthbutton");
    if(objects[1]) objects[1].innerHTML = "You're no longer in heaven.";
    if(objects[2]) objects[2].innerHTML = "You have rebirthed.";
    if(objects[3]) objects[3].style.visibility = "hidden";
    object2.innerHTML = `NPCs have a ${Math.round(100*Math.pow(1.1, player.prestiges)-100)}% stat boost against you.`;
}

function prestige(){
    player.prestige();
    displayStats();
    let object = document.getElementById("prestiges");
    let object2 = document.getElementById("npcboost");
    if(object && object2){
        object.innerHTML = `Prestiges: ${player.prestiges}`;
        object2.innerHTML = `NPCs have a ${Math.round(100*Math.pow(1.1, player.prestiges)-100)}% stat boost against you.`;
    }
}

function kamiBoost(){
    player.kamiBoost();
    displayStats();
    kamiButton("hidden");
}

function nailBoost(){
    player.nailBoost();
    displayStats();
    nailButton("hidden");
}
