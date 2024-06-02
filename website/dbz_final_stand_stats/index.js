function capitalize(str) {
    return str.charAt(0).toUpperCase() + str.slice(1);
}
var Player = /** @class */ (function () {
    function Player(race, level, melee_stat, other_stat, name, _prestiges, _rebirthed) {
        if (level === void 0) { level = 1; }
        if (melee_stat === void 0) { melee_stat = 0; }
        if (other_stat === void 0) { other_stat = 0; }
        if (name === void 0) { name = "Player_Name"; }
        if (_prestiges === void 0) { _prestiges = 0; }
        if (_rebirthed === void 0) { _rebirthed = false; }
        this.kamiBoosted = false;
        this.nailBoosted = false;
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
    Player.prototype.checkErrors = function () {
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
    };
    Player.prototype.init = function (race, level, melee_stat, other_stat, name, _prestiges, _rebirthed) {
        if (level === void 0) { level = 1; }
        if (melee_stat === void 0) { melee_stat = 0; }
        if (other_stat === void 0) { other_stat = 0; }
        if (name === void 0) { name = "Player_Name"; }
        if (_prestiges === void 0) { _prestiges = 0; }
        if (_rebirthed === void 0) { _rebirthed = false; }
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
    };
    Player.prototype.formatStats = function () {
        var text = '';
        text += "<div class=\"lines\">".concat("Name", " <div class=\"points\">").concat(this.name, "</div></div>");
        text += "<div class=\"lines\">".concat("Race", " <div class=\"points\">").concat(capitalize(this.race), "</div></div>");
        text += "<div class=\"lines\">".concat("Level", " <div class=\"points\">").concat(this.level.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Health Max", " <div class=\"points\">").concat(this.other_stat.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Ki Max", " <div class=\"points\">").concat(this.other_stat.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Melee Damage", " <div class=\"points\">").concat(this.melee_stat.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Ki Damage", " <div class=\"points\">").concat(this.other_stat.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Melee Resistance", " <div class=\"points\">").concat(this.other_stat.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Ki Resistance", " <div class=\"points\">").concat(this.other_stat.toString(), "</div></div>");
        text += "<div class=\"lines\">".concat("Speed", " <div class=\"points\">").concat(this.other_stat.toString(), "</div></div>");
        return text;
    };
    Player.prototype.kamiBoost = function () {
        if (this.kamiBoosted) {
            window.alert("You can't use this boost anymore.");
            location.reload();
        }
        if (this.race !== "namekian") {
            window.alert("You're not a namekian, therefore you can't use this boost.");
            location.reload();
        }
        this.kamiBoosted = true;
        this.melee_stat += 20;
    };
    Player.prototype.nailBoost = function () {
        if (this.nailBoosted) {
            window.alert("You can't use this boost anymore.");
            location.reload();
        }
        if (this.race !== "namekian") {
            window.alert("You're not a namekian, therefore you can't use this boost.");
            location.reload();
        }
        this.nailBoosted = true;
        this.melee_stat += 20;
    };
    Player.prototype.showNpcStatBoost = function () {
        var multiplier = 1;
        for (var i = 0; i < this.prestiges; i++) {
            multiplier += multiplier * 0.1;
        }
        console.log("The npcs have a ".concat(Math.floor((multiplier - 1) * 100), "% stat boost against you."));
    };
    Player.prototype.levelUp = function (levels) {
        this.level += levels;
        this.checkErrors();
        if (this.dead) {
            this.other_stat += Math.round(levels);
            this.melee_stat += Math.round(levels * 2);
        }
        else {
            this.other_stat += Math.round(levels * Player.RACE_STATS[this.race]);
            this.melee_stat += Math.round(levels * Player.RACE_STATS[this.race]) + levels;
        }
    };
    Player.prototype.levelDown = function (levels) {
        this.level -= levels;
        this.checkErrors();
        if (this.dead) {
            if (levels < 0) {
                window.alert("You're levelling down while being dead, this will cause inconsistencies in your stats.");
                location.reload();
            }
            this.other_stat -= Math.round(levels);
            this.melee_stat -= Math.round(levels * 2);
        }
        else {
            this.other_stat -= Math.round(levels * Player.RACE_STATS[this.race]);
            this.melee_stat -= Math.round(levels * Player.RACE_STATS[this.race]) + levels;
        }
    };
    Player.prototype.setLevel = function (level) {
        var difference = level - this.level;
        this.level = level;
        this.checkErrors();
        if (this.dead) {
            if (difference < 0) {
                window.alert("You're levelling down while being dead, this will cause inconsistencies in your stats");
                location.reload();
            }
            this.other_stat += Math.round(difference);
            this.melee_stat += Math.round(difference * 2);
        }
        else {
            this.other_stat += Math.round(difference * Player.RACE_STATS[this.race]);
            this.melee_stat += Math.round(difference * Player.RACE_STATS[this.race]) + difference;
        }
    };
    Player.prototype.wishDeath = function () {
        if (Player.MIN_DEATH_LVL > this.level) {
            window.alert("The lowest level, when you can wish death is 602.");
            location.reload();
        }
        if (this.rebirthed) {
            window.alert("You have already rebirthed, you can't die again.");
            location.reload();
        }
        this.dead = true;
    };
    Player.prototype.rebirth = function () {
        if (this.dead && this.level >= 850) {
            this.init(this.race, this.level = 1, this.melee_stat / 10 + 300, this.other_stat / 10 + 300, this.name, this.prestiges, true);
            if (this.race == "namekian") {
                this.kamiBoosted = false;
                this.nailBoosted = false;
            }
        }
        else if (!this.dead) {
            window.alert("You haven't died yet.");
            location.reload();
        }
        else {
            window.alert("You can't rebirth below level 850.");
            location.reload();
        }
    };
    Player.prototype.prestige = function () {
        if (Player.MIN_PRESTIGE_LVL > this.level) {
            window.alert("Your level is not high enough to prestige.");
            location.reload();
        }
        if (this.dead) {
            window.alert("You can't prestige while you're dead.");
            location.reload();
        }
        if (this.rebirthed) {
            this.init(this.race, this.level = 1, this.melee_stat / 5 + 300, this.other_stat / 5 + 300, this.name, this.prestiges + 1, this.rebirthed);
        }
        else {
            this.init(this.race, this.level = 1, this.melee_stat / 5, this.other_stat / 5, this.name, this.prestiges + 1, this.rebirthed);
        }
    };
    Player.RACE_STATS = {
        android: 1,
        saiyan: 1 / 3,
        human: 1 / 2,
        majin: 1 / 2,
        frieza: 1 / 2,
        namekian: 1 / 2,
        jiren: 1 / 2,
    };
    Player.RACES = Object.keys(Player.RACE_STATS);
    Player.MIN_DEATH_LVL = 602;
    Player.MIN_PRESTIGE_LVL = 432;
    return Player;
}());
var player = new Player("namekian");
function displayStats() {
    var object = document.getElementById("stats");
    if (object) {
        object.innerHTML = player.formatStats();
    }
}
function kamiButton(visibility) {
    var object = document.getElementById("kamiboostbtn");
    if (object) {
        object.style.visibility = visibility;
    }
    object = document.getElementById("kamiboost");
    if (object) {
        object.innerHTML = "You have already used you Kami Boost.";
    }
}
function nailButton(visibility) {
    var object = document.getElementById("nailboostbtn");
    if (object) {
        object.style.visibility = visibility;
    }
    object = document.getElementById("nailboost");
    if (object) {
        object.innerHTML = "You have already used you Nail Boost.";
    }
}
function namekianBoost(visibility) {
    var objects = [];
    objects[1] = document.getElementById("kamiboost");
    objects[2] = document.getElementById("nailboost");
    objects[3] = document.getElementById("kamiboostbtn");
    objects[4] = document.getElementById("nailboostbtn");
    for (var i = 0; i < objects.length; i++) {
        if (objects[i]) {
            objects[i].style.visibility = visibility;
        }
    }
    if (objects[1])
        objects[1].innerHTML = "You haven't used you Kami Boost.";
    if (objects[2])
        objects[2].innerHTML = "You haven't used you Nail Boost.";
}
function undo(race) {
    if (race != "namekian") {
        namekianBoost("hidden");
    }
    else {
        namekianBoost("visible");
    }
    var objects = [];
    objects[1] = document.getElementById("heaven");
    objects[2] = document.getElementById("rebirthed");
    objects[3] = document.getElementById("rebirthbutton");
    objects[4] = document.getElementById("deathbutton");
    objects[5] = document.getElementById("npcboost");
    objects[6] = document.getElementById("prestiges");
    if (objects[1])
        objects[1].innerHTML = "You're not in heaven.";
    if (objects[2])
        objects[2].innerHTML = "You haven't rebirthed yet.";
    if (objects[3])
        objects[3].style.visibility = "visible";
    if (objects[4])
        objects[4].style.visibility = "visible";
    if (objects[5])
        objects[5].innerHTML = "NPCs have a 0% stat boost against you.";
    if (objects[6])
        objects[6].innerHTML = "Prestiges: 0";
}
function newPlayer(race) {
    undo(race);
    player = new Player(race);
    displayStats();
}
function setLevel() {
    var level = document.getElementById("setlevelinput").value;
    level = Number(level);
    if (isNaN(level) || level == '') {
        window.alert("NaN");
        return;
    }
    player.setLevel(level);
    displayStats();
}
function levelUp() {
    var level = document.getElementById("levelupinput").value;
    level = Number(level);
    if (isNaN(level) || level == '') {
        window.alert("NaN");
        return;
    }
    player.levelUp(level);
    displayStats();
}
function levelDown() {
    var level = document.getElementById("leveldowninput").value;
    level = Number(level);
    if (isNaN(level) || level == '') {
        window.alert("NaN");
        return;
    }
    player.levelDown(level);
    displayStats();
}
function wishDeath() {
    player.wishDeath();
    displayStats();
    var object = document.getElementById("heaven");
    if (object)
        object.innerHTML = "Now you're in heaven.";
    object = document.getElementById("deathbutton");
    if (object)
        object.style.visibility = "hidden";
}
function rebirth() {
    player.rebirth();
    if (player.race == "namekian") {
        namekianBoost("visible");
    }
    displayStats();
    var objects = [];
    objects[1] = document.getElementById("heaven");
    objects[2] = document.getElementById("rebirthed");
    objects[3] = document.getElementById("rebirthbutton");
    if (objects[1])
        objects[1].innerHTML = "You're no longer in heaven.";
    if (objects[2])
        objects[2].innerHTML = "You have rebirthed.";
    if (objects[3])
        objects[3].style.visibility = "hidden";
    object2.innerHTML = "NPCs have a ".concat(Math.round(100 * Math.pow(1.1, player.prestiges) - 100), "% stat boost against you.");
}
function prestige() {
    player.prestige();
    displayStats();
    var object = document.getElementById("prestiges");
    var object2 = document.getElementById("npcboost");
    if (object && object2) {
        object.innerHTML = "Prestiges: ".concat(player.prestiges);
        object2.innerHTML = "NPCs have a ".concat(Math.round(100 * Math.pow(1.1, player.prestiges) - 100), "% stat boost against you.");
    }
}
function kamiBoost() {
    player.kamiBoost();
    displayStats();
    kamiButton("hidden");
}
function nailBoost() {
    player.nailBoost();
    displayStats();
    nailButton("hidden");
}
