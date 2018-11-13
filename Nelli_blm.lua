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
    include('Nelli-Include.lua')
	send_command('alias MMPP input /ws "Myrkr"; input /echo  Myrkr ;')
	send_command('alias echos input /item "Echo Drops" <me>; input /echo  ECHO DROPS;')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Merit', 'MeritNOMB', 'NOMB')
    state.IdleMode:options('Normal', 'Refresh', 'PDT', 'EXP')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "Drain" <t>')
	send_command('bind !F2 input /ma "Aspir" <t>')
	send_command('bind !F3 input /ma "Aspir II" <t>')
	send_command('bind !F4 input /ma "Aspir III" <t>')
	send_command('bind !F5 input /ma "Bind" <t>')
	send_command('bind !F6 input /ma "Gravity" <t>')
	send_command('bind !F7 input /ma "Stun" <t>')
	send_command('bind !F8 input /ma "Sleep" <t>')
	send_command('bind !F9 input /ma "Sleep II" <t>')
	send_command('bind !F10 input /ja "Manifestation" <me>; /echo --AOE Dark--')
	send_command('bind !F11 gs c cycle CastingMode')
	send_command('bind !F12 gs c cycle OffenseMode')
	
	--exampleaw
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Phalanx" <me>')
	send_command('bind ^F4 input /ma "Aquaveil" <me>')
	send_command('bind ^F5 input /ma "Klimaform" <me>')
	send_command('bind ^F6 input /ma "Dispel" <t>')
	send_command('bind ^F7 input /ma "Frazzle" <t>')
	send_command('bind ^F8 input /ma "Distract" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input ')
	send_command('bind ^F11 input ')
	send_command('bind ^F12 input /ja "Manawell" <me>')


--[[ Debuffs ALT	
	send_command('bind !1 input //exec sch/stone.txt')
	send_command('bind !2 input ///exec sch/water.txt')
	send_command('bind !3 input //exec sch/wind.txt')
	send_command('bind !4 input //exec sch/fire.txt')
	send_command('bind !5 input //exec sch/ice.txt')
	send_command('bind !6 input //exec sch/thun.txt')
	send_command('bind !7 input //exec sch/dark.txt')
	send_command('bind !8 input //exec sch/light.txt')
	send_command('bind !9 input //exec sch/4step.txt')
	send_command('bind !0 input //exec sch/6step.txt')
	send_command('bind !- input /ja "Sublimation" <me>')
	send_command('bind != gs c cycle IdleMode')

	
-- Debuffs ALT	
	--send_command('bind !1 input /ma "Paralyna" <t>')
	--send_command('bind !2 input /ma "Silena" <t>')
	--send_command('bind !3 input /ma "Blindna" <t>')
	--send_command('bind !4 input /ma "Cursna" <t>')
	--send_command('bind !5 input /ma "Stona" <t>')
	--send_command('bind !6 input /ma "Poisona" <t>')
	--send_command('bind !7 input /ma "Viruna" <t>')
	--send_command('bind !8 input /ma "Adloquium" <t>')
	--send_command('bind !9 input /ma "Regen V" <t>')
	--send_command('bind !0 input /ma "Erase" <t>')
	--send_command('bind !- input /ja "Sublimation" <me>')
	--send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Cure" <t>')
	send_command('bind ^2 input /ma "Cure II" <t>')
	send_command('bind ^3 input /ma "Cure III" <t>')
	send_command('bind ^4 input /ma "Cure IV" <t>')
	send_command('bind ^5 input /ma "Haste" <t>')
	send_command('bind ^6 input /ma "Haste" <t>')
	send_command('bind ^7 input /ma "Haste" <t>')
	send_command('bind ^8 input //exec sch/fragmentation.txt')
	send_command('bind ^9 input //exec sch/gravitation.txt')
	send_command('bind ^0 input //exec sch/distortion.txt')
	send_command('bind ^- input //exec sch/fusion.txt')
	send_command('bind ^= input /ja "Alacrity" <me>')
]]--
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
		ammo="Sapience Orb",
        head=gear.merlinicHood_FC,
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		waist="Channeler's Stone",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		legs="Orvail Pants +1",
		feet=gear.merlinicCrackows_FC
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = sets.precast.FC['Enhancing Magic']

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		ear2="Mendicant's earring"
	})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, { 
		ear2="Barkaro. Earring"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		body="Heka's kalasiris",  
		ear2="Mendicant's earring", 
	})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Immanence = {hands="Arbatel bracers "}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
	
	--Default WS MND
    sets.precast.WS = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Jhakri Cuffs +1",
		ring1="Aquasoul Ring",
		ring2="Spiral ring",
        back="Lifestream Cape",
		waist="Pythia Sash +1",
		legs="Vanya slops",
		feet="Inyanga crackows +1"
	}
	
	--WS, MAB Based
    sets.precast.WS['Flash Nova'] = {
        head="Vanya hood",
		neck="Eddy Necklace",
		ear1="Novio Earring",
		ear2="Hecate earring",
        body="Vanya Robe",
		hands="Jhakri Cuffs +1",
		ring1="Prolix ring",
		ring2="Acumen ring",
        back="Lifestream Cape",
		waist="Maniacus sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1s"
	}
	
	-- WS With Gorget/Mnd	
	sets.precast.WS['Realmrazer'] = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Jhakri Cuffs +1",
		ring1="Tamas ring",
		ring2="Aquasoul ring",
        back="Lifestream Cape",
		waist="Fotia Belt",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
	}
	
	--Gorget	
	sets.precast.WS['Hexastrike'] = {	
        head="Vanya Hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Jhakri Cuffs +1",
		ring1="Mars's Ring",
		ring2="Spiral Ring",
        back="Lifestream Cape",
		waist="Fotia Belt",
		legs="Vanya slops",
		feet="Inyanga crackows +1"
	}
		
	sets.precast.WS['Myrkr'] = {
		ammo="Hydrocera",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Mendicant's Earring",
		ear2="Andoaa Earring",
		body="Vanya Robe",
		hands="Nares Cuffs",
		ring1="Prolix Ring",
		ring2="Lebeche Ring",
		back="Oretania's cape +1",
		waist="Luminary Sash",
		legs="Merlinic Shalwar",
		feet="Chelona Boots"
	}	

    
    -- Cure sets

    sets.midcast.Cure = {
		ammo="Hydrocera",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
		hands="Jhakri Cuffs +1",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Oretania's cape +1",
		waist=gear.ElementalObi,
		legs="Vanya Slops",
		feet="Kaykaus Boots"
	}

    sets.midcast.Curaga = {
		ammo="Hydrocera",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
		hands="Jhakri Cuffs +1",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Oretania's cape +1",
		waist=gear.ElementalObi,
		legs="Vanya Slops",
		feet="Kaykaus Boots"
	}
	
	sets.midcast.conserve = {
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's Earring",
        body="Hedera Cotehardie",
        back="Vita Cape",
		waist="Pythia sash +1",
		legs="Vanya slops",
		feet="Kaykaus Boots"
	}
	
	sets.midcast['Arise'] = sets.midcast.conserve
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve
	sets.midcast.Recall = sets.midcast.conserve
	
	
    sets.midcast.CureMelee = {
        head="Kaykaus mitra",
		neck="Nodens Gorget",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
        body="Orison Bliaud +2",
		hands="Augur's Gloves",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Lifestream Cape",
		waist="Pythia sash +1",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}

    sets.midcast.Cursna = {
        head="Kaykaus mitra",
		neck="Colossus's Torque",
        body="Orison Bliaud +2",
		hands="Augur's Gloves",
		ring1="Haoma's ring",
		ring2="Sirona's Ring",
        back="Lifestream Cape",
		waist="Ninurta's Sash",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}

    sets.midcast.StatusRemoval = {
        head="Kaykaus mitra",
		neck="Colossus's Torque",
        body="Orison Bliaud +2",
		hands="Augur's Gloves",
		ring1="Haoma's ring",
		ring2="Sirona's Ring",
        back="Lifestream Cape",
		waist="Ninurta's Sash",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}


    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
        head="Befouled crown",
		neck="Incanter's Torque",
        body="Anhur Robe",
		hands="Chironic gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Portent Pants"
	}
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine Gloves",
		legs="Telchine braconi",
		feet="Telchine pigaches"
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine Gloves",
		legs="Telchine braconi",
		feet="Telchine pigaches"
	})
	
	sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine Gloves",
		legs="Telchine braconi",
		feet="Telchine pigaches"
	})

	sets.midcast.Klimaform = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine Gloves",
		legs="Telchine braconi",
		feet="Telchine pigaches"
	})

	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Stone Gorget",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})

    sets.midcast.BarElement = {
        head="Befouled crown",
		neck="Incanter's Torque",
        body="Anhur Robe",
		hands="Chironic gloves",
		hands="Chironic gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Portent Pants"
	}

    sets.midcast.Regen = {
        head="Inyanga tiara +1", 
		body="Piety Briault",
		back="Lugh's cape",
        legs="Piety Pantaloons"
	}
   
 	sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric gages",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
 
	sets.midcast['Elemental Magic'].MeritNOMB = {
		ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Spaekona's Coat +1",
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Strendu Ring",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}	
	
	sets.midcast['Elemental Magic'].Merit = {
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Spaekona's Coat +1",
		hands="Amalric gages",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}	

	sets.midcast['Elemental Magic'].NOMB = {
		ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,
		neck="Saevus Pendant +1",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Strendu Ring",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	
	 sets.midcast.Death = {
		ammo="Pemphredo tathlum",
		head="Pixie Hairpin +1",
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric Gages",
		ring1="Mujin Band",
		ring2="Archon Ring",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	 sets.midcast.Comet = {
		ammo="Pemphredo tathlum",
		head="Pixie Hairpin +1",
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric Gages",
		ring1="Mujin Band",
		ring2="Archon Ring",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast.Impact = {
		ammo="Pemphredo tathlum",
		head="",
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Twilight Cloak",
		hands="Amalric Gages",
		ring1="Mujin Band",
		ring2="Archon Ring",
        back="Izdubar mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	
	
	sets.midcast.sleep = {
		ammo="Pemphredo tathlum",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +1",
		ring1="Kishar Ring",
		ring2="Archon Ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet=gear.merlinicCrackows_Magic
	}	
		
    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo tathlum",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Kishar Ring",
		ring2="Archon Ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet="Uk'uxkaj boots"
	}
	
	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		head=gear.merlinicHood_Magic,
		ring2="Evanscence ring",
		legs="Jhakri Slops +1",
		feet=gear.merlinicCrackows_Macc
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		head=gear.merlinicHood_Magic,
		ring2="Evanscence ring",
		legs="Jhakri Slops +1",
		feet=gear.merlinicCrackows_Macc
	})
	
	

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		ammo="Hydrocera",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri cuffs +1",
		ring1="Leviathan Ring",
		ring2="Kishar Ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}

    sets.midcast.IntEnfeebles = {
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
		body=gear.merlinicJubbah_Magic,
		hands="Jhakri cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Kishar ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
        head="Orvail Corona +1",
		neck="Eidolon Pendant +1",
		ear1="Moonshade Earring",
		ear2="Relaxing Earring",
        body="Oracle's robe",
		hands="Nares Cuffs",
		ring1="Prolix Ring",
		ring2="Tamas Ring",
        back="Vita Cape",
		legs="Menhit slacks",
		feet="Chelona Boots"
	}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
        head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa Earring +1",
        body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Mallquis Clogs +1"
	}

    sets.idle.Refresh = {
        head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa Earring +1",
        body="Jhakri Robe +1",
		hands="Serpentes cuffs",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Serpentes sabots"
	}	
		
    sets.idle.PDT = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade earring",
		ear2="Odnowa Earring +1",
        body="Vanya Robe",
		hands="Jhakri Cuffs +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
		}
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
        body="Wayfarer Robe",
		hands="Jhakri Cuffs +1",
		ring1="Mars's Ring",
		ring2="Spiral ring",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Vanya slops",
		feet="Vanya clogs"
	}

	
	sets.latent_refresh = {waist="Fucho-no-Obi"}


	
--Sample For Defending Ring
--DarkRing.physical = {name="Defending Ring",augments={"[1]Accuracy+9","[2]STR+4"}}
--DarkRing.physical2 = {name="Defending Ring",augments={"[1]Attack+12","[2]\"Mag.Atk.Bns\"+12","[3]STR+11"}}
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change. Turn this one to Meele.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------


function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Pythia Sash +1"
		if spell.element == world.weather_element or
		spell.element == world.day_element then 
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
		gear.default.obi_waist = "Refoccilation Stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
		if state.CastingMode.value == 'Proc' then
			classes.CustomClass = 'Proc'
		end
	end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(4, 14)
end
