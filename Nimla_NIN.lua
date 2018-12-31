-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false
	
	send_command('alias mab input /equip main "ochu"; input /equip sub "ochu";' )
	send_command('alias tp1 input /equip main "Uchigatana";' )
	send_command('alias tp input /equip main "Heishi Shorinken"; input /equip sub "Kikoku";' )
	
	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias cel input /item "Rubicund Cell" <t>; input /item "Cobalt Cell" <t>; input /item "Phase Displacer" <t>;')
	send_command('alias dis input /item "Phase Displacer" <t>; ')
	send_command('alias atk input /attack <bt>; ')

	send_command('alias key input /item "Forbidden Key" <t>; ')
	send_command('alias ech input /item "Echo Drops" <me>; ')
	send_command('alias holy input /item "Holy Water" <me>; ')
	send_command('alias rem input /item "Remedy" <me>; ')

	send_command('alias vok input /ja "Provoke" <t>; ')
	send_command('alias key input /item "Forbidden Key" <t>; ')

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Hachiya Kyahan +1"

	send_command('bind @1 input /ja "provoke" <t>')
	send_command('bind @2 input /ma "utsusemi: ichi" <me>')
	send_command('bind @3 input /ma "tsusemi: ni" <me>')
	send_command('bind @4 input /ma "tsusemi: san" <me>')
	send_command('bind @5 input /ma "Cure V" <t>')
	send_command('bind @6 input /ma "Cure VI" <t>')
	send_command('bind @7 input /ja "Shield Bash" <t>')
	send_command('bind @8 input /ma "Regen IV" <t>')
	send_command('bind @9 input //exec thf/SA_Rudra.txt')
	send_command('bind @0 input //exec thf/SA_Mandalic.txt')
	send_command('bind @- input /ma "Devotion" <t>')
	send_command('bind @= input /ja "Divine Seal" <me>')

-- Misc CTRL	
	send_command('bind ^1 input /ja "Haste Samba" <me>')
	send_command('bind ^2 input /ws "pyrrhic kleos" <t>')
	send_command('bind ^3 input /ja "reverse flourish" <me>')
	send_command('bind ^4 input /ja "aggressor" <me>')
	send_command('bind ^5 input /ma "Chocobo mazurka" <me>')
	send_command('bind ^6 input /ma "Cure VI" <t>')
	send_command('bind ^7 input /ja "Shield Bash" <t>')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input /ja "spectral jig" <me>')
	send_command('bind ^0 input //exec thf/SA_Mandalic.txt')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ja "provoke" <t>')
	send_command('bind !2 input /ws "Blade: Shun" <t>')
	send_command('bind !3 input /ws "Exenterator" <t>')
	send_command('bind !4 input /ja "warcry" <me>')
	send_command('bind !5 input /ja "warcry" <me>')
	send_command('bind !6 input /ja "no foot rise" <me>')
	send_command('bind !7 input /ja "presto" <me>')
	send_command('bind !8 input /ja "contradance" <me>')
	send_command('bind !9 input /ja "chocobo jig II" <me>')
	send_command('bind !0 input //exec thf/TA_Mandalic.txt')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != input //gs c cycle OffenseMode')
	
-- 	Buffs CTRL

	send_command('bind @F1 input /ja "flee" <me>')
	send_command('bind @F2 input /ja "sneak attack" <me>')
	send_command('bind @F3 input /ja "trick attack" <me>')
	send_command('bind @F4 input /ma "Dispel" <t>')
	send_command('bind @F5 input /ma "Dia II" <t>')
	send_command('bind @F6 input /ma "Slow" <t>')
	send_command('bind @F7 input /ma "Paralyze" <t>')
	send_command('bind @F8 input /ma "Addle" <t>')
	send_command('bind @F9 input /ma "Silence" <t>')
	send_command('bind @F10 input /ma "Holy II" <t>')
	send_command('bind @F11 input /ma "Banish III" <t>')
	send_command('bind @F12 input /ja "Accession" <me>; input /echo --AOE--')

	send_command('bind ^F1 input /ja "quickstep" <t>')
	send_command('bind ^F2 input /ja "box step" <t>')
	send_command('bind ^F3 input /ja "Stutter Step" <t>')
	send_command('bind ^F4 input /ja "feather step" <t>')
	send_command('bind ^F5 input /ja "animated flourish" <t>')
	send_command('bind ^F6 input /ja "no foot rise" <me>')
	send_command('bind ^F7 input /ja "steal" <t>')
	send_command('bind ^F8 input /ja "despoil" <t>')
	send_command('bind ^F9 input /ja "bully" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input /ma "Banish III" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE--')
	
	send_command('bind !F1 input //send @others /p test')
	send_command('bind !F2 input /ja "Curing Waltz II" <stpc>')
	send_command('bind !F3 input /ja "Curing Waltz III" <stpc>')
	send_command('bind !F4 input /ja "Curing Waltz IV" <stpc>')
	send_command('bind !F5 input /ja "Curing Waltz V" <stpc>')
	send_command('bind !F6 input /ja "Healing Waltz" <stpc>')
	send_command('bind !F7 input /ja "Divine Waltz" <me>')
	send_command('bind !F8 input /ja "Divine Waltz II"  <me>')
	send_command('bind !F9 input /ma "Silence" <t>')
	send_command('bind !F10 input /ma "Holy II" <t>')
	send_command('bind !F11 input /ma "Banish III" <t>')
	send_command('bind !F12 input /ja "Accession" <me>; input /echo --AOE--')
	
    
    select_movement_feet()
    --select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {}
    sets.precast.JA['Futae'] = {legs="Hattori Tekko +1"}
    sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail +1"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {}

    sets.precast.Flourish1 = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {head={ name="Herculean Helm", augments={'Accuracy+21','Weapon skill damage +5%','AGI+3','Attack+14',}},left_ear="Etiolation Earring", right_ear="Loquac. Earring",ring1="Prolix Ring"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +1",feet="Hattori Kyahan +1",back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}})

    -- Snapshot for ranged
    sets.precast.RA = {}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
    head={ name="Herculean Helm", augments={'"Triple Atk."+3','DEX+5','Accuracy+13','Attack+11',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+9 Attack+9','"Triple Atk."+3','STR+2','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS,{})

    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,{})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS,{})

    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{})
    
    --------------------------------------
 -- Midcast Sets
    
    sets.midcast.FastRecast = {back="Andartia's mantle",feet="Hattori Kyahan +1"}

 	sets.midcast.Utsusemi = {back="Andartia's mantle",hands="Mochizuki tekko +2",feet="Hattori Kyahan +1"}
	
	sets.midcast.ElementalNinjutsu = {
        head=gear.herculeanHelm_MAB,neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body="Samnuha coat",hands="Leyline gloves",ring1="Shiva ring +1",ring2="Dingir ring",
        back="",waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}

	sets.midcast.NinjutsuDebuff = {ammo="Yamarang",
        head="Hachiya Hatsuburi +3",neck="Sanctity necklace",ear1="Dignitary's earring",ear2="Enchanter earring +1",
        body="Samnuha coat",hands="Mochizuki Tekko +2",ring1="Regal ring",ring2="Etana ring",
        back="",waist="Eschan stone",legs="Mochizuki hakama +1",feet=gear.herculeanBoots_MAB}

	sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi +3",neck="Incanter's torque",back="Yokaze Mantle", hands="Mochizuki tekko +2"}
	
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {ammo="Happo Shuriken",
    head="Blistering Sallet",
    body="Hiza. Haramaki +1",
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +4%','STR+10','Accuracy+4',}},
    feet=gear.MovementFeet,
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Sheltered Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
}
    
    -- Idle sets
    sets.idle = {ammo="Happo Shuriken",
    head="Blistering Sallet",
    body="Hiza. Haramaki +1",
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +4%','STR+10','Accuracy+4',}},
    feet=gear.MovementFeet,
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Sheltered Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
}

  
    
    sets.idle.Weak = {ammo="Happo Shuriken",
    head="Blistering Sallet",
    body="Hiza. Haramaki +1",
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +4%','STR+10','Accuracy+4',}},
    feet=gear.MovementFeet,
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Sheltered Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body="Hiza. Haramaki +1",
    hands="Hizamaru Kote +1",
    legs="Hiza. Hizayoroi +1",
    feet="Hiza. Sune-Ate +1",
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Petrov Ring",
    right_ring="Fortified Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.defense.PDT = {ammo="Happo Shuriken",
    head="Blistering Sallet",
    body="Hiza. Haramaki +1",
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +4%','STR+10','Accuracy+4',}},
    feet={ name="Herculean Boots", augments={'Weapon skill damage +3%','STR+5','Attack+4',}},
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Sheltered Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
}
    sets.defense.MDT = {ammo="Happo Shuriken",
    head="Blistering Sallet",
    body="Hiza. Haramaki +1",
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +4%','STR+10','Accuracy+4',}},
    feet={ name="Herculean Boots", augments={'Weapon skill damage +3%','STR+5','Attack+4',}},
    neck="Loricate Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Sheltered Ring",
    right_ring="Fortified Ring",
    back="Solemnity Cape",
}
    sets.Kiting = {feet=gear.MovementFeet}
	
    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Seki Shuriken",
    head={ name="Herculean Helm", augments={'"Triple Atk."+3','DEX+5','Accuracy+13','Attack+11',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands="Adhemar wristbands",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+9 Attack+9','"Triple Atk."+3','STR+2','Accuracy+14',}},
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
}	
    sets.engaged.Acc = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs="Hiza. Hizayoroi +1",
    feet="Hiza. Sune-Ate +1",
    neck="Yarak Torque",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Cacoethic Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack6+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Evasion = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body="Hiza. Haramaki +1",
    hands="Hizamaru Kote +1",
    legs="Hiza. Hizayoroi +1",
    feet="Hiza. Sune-Ate +1",
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Genmei Earring",
    right_ear="Ethereal Earring",
    left_ring="Petrov Ring",
    right_ring="Fortified Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.Evasion = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs="Hiza. Hizayoroi +1",
    feet="Hiza. Sune-Ate +1",
    neck="Yarak Torque",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Cacoethic Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.PDT = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}	
    sets.engaged.Acc.PDT = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}	
    -- Custom melee group: High Haste (~20% DW)
    sets.engaged.HighHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.HighHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Evasion.HighHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.Evasion.HighHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.PDT.HighHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.PDT.HighHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}

    -- Custom melee group: Embrava Haste (7% DW)
    sets.engaged.EmbravaHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.EmbravaHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Evasion.EmbravaHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.Evasion.EmbravaHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.PDT.EmbravaHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.PDT.EmbravaHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",
    neck="Lissome Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}

    -- Custom melee group: Max Haste (0% DW)
    sets.engaged.MaxHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",neck="Lissome Necklace",waist="Windbuffet Belt +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    left_ring="Petrov Ring",right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}},
}
    sets.engaged.Acc.MaxHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",neck="Lissome Necklace",waist="Windbuffet Belt +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    left_ring="Petrov Ring",right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
}	
    sets.engaged.Evasion.MaxHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",neck="Lissome Necklace",waist="Windbuffet Belt +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    left_ring="Petrov Ring",right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
}	
    sets.engaged.Acc.Evasion.MaxHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",neck="Lissome Necklace",waist="Windbuffet Belt +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    left_ring="Petrov Ring",right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
}	
    sets.engaged.PDT.MaxHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",neck="Lissome Necklace",waist="Windbuffet Belt +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    left_ring="Petrov Ring",right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
}	
    sets.engaged.Acc.PDT.MaxHaste = {ammo="Happo Shuriken",
    head="Hizamaru Somen +1",
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Floral Gauntlets", augments={'Rng.Acc.+15','Accuracy+15','"Triple Atk."+3','Magic dmg. taken -4%',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Hiza. Sune-Ate +1",neck="Lissome Necklace",waist="Windbuffet Belt +1",ear1="Bladeborn Earring",ear2="Steelflash Earring",
    left_ring="Petrov Ring",right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10',}}
}	


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Hattori Ningi +2"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {}
    sets.buff.Innin = {}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


function select_movement_feet()
    if world.time >= 17*60 or world.time < 7*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 3)
    else
        set_macro_page(1, 3)
    end
end

