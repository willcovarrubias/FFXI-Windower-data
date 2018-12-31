-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	--include('autoRing.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = (180 + 15 + 20 + 40) * 1.18
	--Bagua Pants 15
	--Azimuth Feet 20
	--Job Points 40
    --Lifestream Aug 18%
	--send_command('exec geobind.txt')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'NOMB', 'Merit')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')

	-- 	Buffs ALT
	send_command('bind !F1 input /item "Mana mist" <me>')
	send_command('bind !F2 input /item "Mana Powder" <me>')
	send_command('bind !F3 input /ma "Aspir II" <t>')
	send_command('bind !F4 input /ma "Break" <t>')
	send_command('bind !F5 input /ma "Bind" <t>')
	send_command('bind !F6 input /ma "Gravity" <t>')
	send_command('bind !F7 input /ma "Stun" <t>')
	send_command('bind !F8 input /ma "Sleep" <t>')
	send_command('bind !F9 input /ma "Sleep II" <t>')
	send_command('bind !F10 input /ja "Manifestation" <me>; /echo --AOE Dark--')
	send_command('bind !F11 gs c cycle CastingMode')
	send_command('bind !F12 gs c cycle OffenseMode')
	
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
	send_command('bind ^F10 input /ma "" <t>')
	send_command('bind ^F11 input /ma "" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE Light--')
	
-- Debuffs ALT	
	send_command('bind !1 input /ma "Paralyna" <t>')
	send_command('bind !2 input /ma "Silena" <t>')
	send_command('bind !3 input /ma "Blindna" <t>')
	send_command('bind !4 input /ma "Cursna" <t>')
	send_command('bind !5 input /ma "Stona" <t>')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Poisona" <t>')
	send_command('bind !9 input /ma "" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input /ja "Full Circle" <me>')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Indi-Torpor" Maximuss')
	send_command('bind ^2 input /ma "Geo-Frailty" <t>')
	send_command('bind ^3 input /ma "Cure III" <t>')
	send_command('bind ^4 input /ma "Cure IV" <t>')
	send_command('bind ^5 input /ma "" <t>')
	send_command('bind ^6 input /ma "Flurry" <t>')
	send_command('bind ^7 input /ma "Haste" <t>')
	send_command('bind ^8 input /ma "Regen V" <t>')
	send_command('bind ^9 input /ma "Thundara II" <t>')
	send_command('bind ^0 input /ma "Blizzara II" <t>')
	send_command('bind ^- input /ma "Fira II" <t>')
	send_command('bind ^= input //radial')
	
    gear.default.weaponskill_waist = "Refoccilation Stone"
	
	state.MagicBurst = M(false, 'Magic Burst')

    --select_default_macro_book()
	
	include('Kyouhei-Include.lua')
	send_command('alias radial input /equip feet "Bagua Sandals +1"; /ja "Radial Arcana"; /input /wait 1; input /equip feet "Bagua Sandals +1";')
	send_command('alias echos input /item "Echo Drops" <me>; input /echo  ECHO DROPS;')
	send_command('alias mirrors input /item "Mirror\'s Tonic"; input /echo  Petrify screen;')
	send_command('alias terror input /item "Steadfast Tonic"; input /echo  Terror Screen;')
	send_command('alias Sav input /item "Savior\'s Tonic"; input /echo  Doom Screen;')
	send_command('alias MMPP input /ws "Moonlight"; input /echo  Moonlight;')
	send_command('alias reme input /item "Remedy" <me>; input /echo  REMEDY;')
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic +2", back="Nantosuelta's Cape"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1"}
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines"}
	sets.precast.JA['Primeval Zeal'] = {head="Bagua Galero"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
    sets.precast.JA['Radial Arcana'] = {hands="Bagua Sandals +1"}
	
    -- Fast cast sets for spells

    sets.precast.FC = { 
		main={name="Grioavolr",priority=16},
		sub={name="Umbra Stap",priority=15},
        head= gear.merlinicHood_FC,
		neck="Orunmila's Torque",
		ear1="Enchanter earring +1",
		ear2="Loquacious Earring",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		waist="Channeler's Stone",
        back="Lifestream Cape",
		legs="Geomancy Pants +1",
		feet=gear.merlinicCrackows_FC
	}
	
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		body="Heka's kalasiris", 
		ear2="Mendicant's earring"
	})
	
    sets.precast.FC.Cure = sets.precast.FC

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua Mitaines"})
    
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {neck="Fotia Gorget",waist="Fotia Belt"}

		--Default WS MND
    sets.precast.WS = {
        head="Sukeroku Hachi.",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Vanya Cuffs",
		ring1="Cacoethic Ring +1",
		ring2="Apate Ring",
        back="Nantosuelta's Cape",
		waist="Fotia Belt",
		legs="Querkening brais",
		feet="Vanya clogs"
	}
	
	sets.precast.WS['Moonlight']= {
		neck="Fotia Gorget",
		waist="Fotia Belt"
	}
	
	
	--WS, MAB Based
    sets.precast.WS['Flash Nova'] = {
        head=gear.merlinicHood_Magic,
		neck="Eddy Necklace",
		ear1="Barkarole earring",
		ear2="Regal Earring",
        body="Jhakri Robe +2",
		hands="Otomi Gloves",
		ring1="Strendu ring",
		ring2="Stikini Ring +1",
        back="Nantosuelta's Cape",
		waist="Refoccilation Stone",
		legs="Gyve trousers",
		feet="Umbani boots"
	}
	
	-- WS With Gorget/Mnd	
	sets.precast.WS['Realmrazer'] = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Lifestorm Earring",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Vanya Cuffs",
		ring1="Tamas ring",
		ring2="Aquasoul ring",
        back="Nantosuelta's Cape",
		waist="Fotia Belt",
		legs="Vanya Slops",
		feet="Vanya Clogs"
	}
	
	--Gorget	
	sets.precast.WS['Hexastrike'] = {	
        head="Vanya Hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Vanya Cuffs",
		ring1="Mars's Ring",
		ring2="Spiral Ring",
        back="Nantosuelta's Cape",
		waist="Fotia Belt",
		legs="Vanya slops",
		feet="Vanya Clogs"
	}
	
    --------------------------------------
    -- Midcast sets
    --------------------------------------
	
	-- Cure Omen--
	--[[sets.midcast.Cure = {
		main={name="Ames", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		head="Bagua galero", 
		neck="Sanctity necklace", 
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1", 
		body="Bagua tunic", 
		hands="Geomancy mitaines +3", 
		ring1="Haoma's Ring",
		ring2="Meridian ring", 
		back="Lifestream Cape", 
		waist="Pythia Sash +1", 
		legs="Bagua Pants +1", -
		feet="Azimuth gaiters"
	}]]--
	
	---Normal Cure--
    
	sets.midcast.Cure = {
		main={name="Grioavolr",priority=16},
		sub={name="Giuoco Grip", priority=15},
		head="Vanya Hood", 
		neck="Incanter's Torque", 
		ear1="Novia Earring", 
		ear2="Mendicant's Earring", 
		body="Vrikodara Jupon", 
		hands="Telchine Gloves",
		ring1="Lebeche Ring", 
		ring2="Stikini Ring +1",
        back="Solemnity Cape", 
		waist=gear.ElementalObi, 
		legs="Vanya Slops", 
		feet="Vanya clogs"
	}

    sets.midcast.Curaga = {
		main={name="Grioavolr",priority=16},
		sub={name="Giuoco Grip", priority=15},
		head="Vanya Hood", 
		neck="Incanter's Torque", 
		ear1="Novia Earring",
		ear2="Mendicant's Earring", 
		body="Heka's kalasiris",
		hands="Telchine Gloves",		
		ring1="Haoma's Ring", 
		ring2="Stikini Ring +1",
        back="Solemnity Cape", 
		waist=gear.ElementalObi, 
		legs="Vanya Slops", 
		feet="Vanya clogs"
	}
	
	sets.midcast.conserve = {
		main={name="Grioavolr",priority=16},
		sub={name="Giuoco grip",priority=15},
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
        back="Solemnity cape",
		waist="Austerity Belt +1",
		legs="Vanya slops",
		feet="Vanya Clogs"
	}
	
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve
	
    sets.midcast.FastRecast = {
        head=gear.merlinicHood_FC,neck="Orunmila's Torque",
        body="Vrikodara Jupon",
        waist="Ninurta's Sash",legs=gear.merlinicShalwar_Magic}

	sets.midcast.Cursna = {
        head="Vanya Hood",
		neck="Malison Medallion",
		hands="Augur's Gloves",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		back="Oretan. Cape +1",
		feet="Vanya clogs"
	}	

   -- Enhancing Magic Skill
 sets.midcast['Enhancing Magic'] = {
		main={name="Gada",priority=16},
		sub={name="Ammurapi Shield",priority=15},
        head="Telchine Cap",
		neck="Incanter's Torque",
		ear2="Andoaa Earring",
        body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		waist="Olympus Sash",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing	
	}
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Stone Gorget",
		ear1="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{
		Main="Vadose Rod",
		sub="Ammurapi Shield",
		head="Chironic hat",
		legs="Shedir Seraweels"
	})
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.midcast.Refresh = sets.midcast.Haste
	sets.midcast.Regen = sets.midcast.Haste
	sets.midcast.Phalanx = sets.midcast.Haste
	sets.midcast.Flurry = sets.midcast.Haste
	
    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
        head="Telchine Cap",
		neck="Incanter's Torque",
        body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		waist="Olympus Sash",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})

    sets.midcast.Protect = {
		ring1="Sheltered Ring",
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	}

    sets.midcast.Shell = sets.midcast.Protect 
	sets.midcast.Shellra = sets.midcast.Protect 
	sets.midcast.Protectra = sets.midcast.Protect 

	--- Geomancy ---

	sets.midcast.Geomancy = set_combine(sets.midcast.conserve, {
		main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Incanter's Torque",
		body="Azimuth Coat",
		hands="Geomancy mitaines +3",
		back="Lifestream Cape",
		legs="Bagua Pants +1",
		feet="Azimuth Gaiters +1"
	})		
	
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.conserve, {
		main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Incanter's Torque",
		body="Azimuth coat",
		hands="Geomancy mitaines +3",
		back="Lifestream Cape",
		legs="Bagua Pants +1",
		feet="Azimuth Gaiters +1"
	})
	
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    -- Idle sets

    sets.idle = {
		main= {name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		range="Dunna",
		head="Azimuth hood +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Jhakri Robe +2",
		hands="Geomancy mitaines +3",
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Bagua Sandals +1"	
	}

	sets.idle.Refresh = {
		main={name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Jhakri Robe +2",
		hands="Bagua Mitaines",
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Herald's Gaiters"	
	}	
	
    sets.idle.PDT = {
		main={name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		range="Dunna",
		head="Blistering Sallet +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Vrikodara jupon",
		hands="Geomancy mitaines +3",
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Gyve Trousers",
		feet="Azimuth Gaiters +1"	
	}

    -- .Pet sets are for when Luopan is present.
	
	sets.idle.Pet = {
		main={name="Idris",priority=16},
		sub={name="Genmei Shield", priority=15},
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
		body=gear.telchineChasuble_Pet,
		hands="Telchine Gloves",
		ring1="Dark Ring",
		ring2="Defending Ring",
		back=gear.NantosueltaCape_Pet,
		waist="Isa Belt",
		legs=gear.telchineBraconi_Pet, 
		feet="Bagua Sandals +1"
	}

	sets.idle.PetHybrid = {
        head="Anwig salade",neck="Empath necklace",ear1="Enmerkar earring",ear2="Rimeice earring",
        body="Pitre tobe +1",hands="Rao kote",ring1="Varar ring",ring2="Varar Ring",
        back="Visucius's mantle",waist="Isa belt",legs=gear.herculeanTrousers_Pet,feet="Rao sune-ate"}
	

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle)
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet)
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT)
    --sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet)

    --[[sets.idle.Weak = {main="Terra's Staff",sub="Oneiros Grip",range="Dunna",
		head="Spurrina Coif",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Barkarole Earring",
		body="Vrikodara Jupon",hands="Geomancy Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}]]--

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Spurrina Coif",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Barkarole Earring",
		body="Vrikodara Jupon",hands="Geomancy Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Spurrina Coif",neck="Loricate Torque +1",ear1="Regal Earring",ear2="Barkarole Earring",
		body="Vrikodara Jupon",hands="Geomancy Mitaines +1",ring1="Dark Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.Kiting = {feet="Geomancy Sandals +1"}

    sets.latent_refresh = {}


    -- Elemental Magic sets

	sets.midcast['Elemental Magic'] = {
        main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
        head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric Gages",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
        back=gear.NantosueltaCape_Magic,
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast['Elemental Magic'].NOMB = {
        main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,
		neck="Saevus Pendant +1",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring1="Shiva Ring +1",
		ring2="Strendu Ring",
        back=gear.NantosueltaCape_Magic,
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast['Elemental Magic'].Merit = set_combine(sets.midcast['Elemental Magic'], {
		body="Seidr Cotehardie"
	})
	
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {body="Twilight Cloak",head=""})
	
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {neck="Mizukage-no-Kubikazari",back="Seshaw Cape",lring="Mujin Band",ring2="Shiva Ring +1"})
    
    sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'], {body="Twilight Cloak",head=""})

	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight Cloak",head=""})

    sets.midcast['Dark Magic'] = {
		main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		ammo="Pemphredo Tathlum",
		head=gear.merlinicHood_Magic,
		neck="Erra Pendant",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
		body=gear.merlinicJubbah_Magic,
		hands="Geomancy Mitaines +3",
		ring1="Stikini Ring +1",
		ring2="Evanscence ring",
		back=gear.NantosueltaCape_Magic,
		waist="Luminary Sash",
		legs=gear.merlinicShalwar_Magic,
		feet=gear.merlinicCrackows_Magic
	}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
		head="Bagua Galero",
		waist="Fucho-no-obi",
		feet=gear.merlinicCrackows_Magic
	})
    
    sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {neck="Orunmila's Torque", back="Lifestream Cape", waist="Ninurta's Sash", legs="Geomancy Pants +1"})

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Dignitary Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Geomancy Mitaines +3",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
        back=gear.NantosueltaCape_Magic,
		waist="Luminary sash",
		legs=gear.merlinicShalwar_Magic,
		feet="Jhakri pigaches +2"
	}

    sets.midcast.IntEnfeebles = {
		main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Geomancy Mitaines +3",
		ring1="Kishar Ring",
		ring2="Stikini Ring +1",
       back=gear.NantosueltaCape_Magic,
		waist="Luminary sash",
		legs=gear.merlinicShalwar_Magic,
		feet="Jhakri pigaches +2"
	}

	sets.midcast.Sleep = set_combine(sets.midcast.IntEnfeebles,{
		main={name="Idris", priority=16},
		sub={name="Ammurapi Shield", priority=15},
		ring1="Archon Ring",
		ring2="Stikini Ring +1",
        back=gear.NantosueltaCape_Magic,
		legs="Jhakri slops +2",
		feet=gear.merlinicCrackows_Macc
	})	
	
	sets.midcast.dispel = sets.midcast.sleep
	
	
	sets.engaged = sets.idle.Pet
	
    --------------------------------------
    -- Engaged sets
	
	--[[sets.engaged = {
        head="Blistering sallet +1",
		neck="Lissome Necklace",
		ear1="Brutal Earring",
		ear2="Odnowa earring +1",
        body="Vanya's Robe",
		hands="Gazu Bracelet +1",
		ring1="Cacoethic ring +1",
		ring2="Petrov Ring",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Querkening brais",
		feet="Vanya Clogs"
	}]]--
	
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    --[[sets.engaged = {main=gear.grioavolr_Magic, sub="Oneiros Grip",range="Dunna",
		head="Blistering Sallet +1",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Telos Earring",
		body="Onca Suit",hands="",ring1="Rajas Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Ninurta's Sash",legs="",feet=""}]]--

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Ninurta's Sash"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "Refoccilation Stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
    end
	if spell.english == 'Death' then
		cancel_spell()
		if windower.ffxi.get_player()['sub_job'] == 'SCH' then
			if buffactive.Silence then
				send_command('input /item "Echo Drops" <me>')
			elseif not buffactive.Stoneskin then
				send_command('Stoneskin')
			elseif not buffactive.Blink then
				send_command('Blink')
			elseif not (buffactive.Sandstorm or buffactive.Rainstorm or buffactive.Windstorm or buffactive.Firestorm or buffactive.Hailstorm) then
				send_command('thestorm')
			elseif not buffactive.Klimaform then
				send_command('Klimaform')
			elseif not buffactive.Aquaveil then
				send_command('Aquaveil')
			elseif not buffactive.Protect then
				send_command('Protect2')
			elseif not buffactive.Shell then
				send_command('Shell2')
			elseif not buffactive.Aquaveil then
				send_command('Aquaveil')
			elseif windower.ffxi.get_player()['vitals']['hp']+300 < windower.ffxi.get_player()['vitals']['max_hp'] then
				send_command('cure3 '..windower.ffxi.get_player()['name'])
			else
				send_command('slu;gs equip sets.idle.PDT')
			end
		elseif windower.ffxi.get_player()['sub_job'] == 'RDM' then
			if buffactive.Silence then
				send_command('input /item "Echo Drops" <me>')
			elseif not buffactive.Stoneskin then
				send_command('Stoneskin')
			elseif not buffactive.Blink then
				send_command('Blink')
			elseif not buffactive.Phalanx then
				send_command('Phalanx')
			elseif not buffactive.Haste then
				send_command('Haste')
			elseif not buffactive.Refresh then
				send_command('Refresh')
			elseif not buffactive.Aquaveil then
				send_command('Aquaveil')
			elseif not buffactive.Protect then
				send_command('Protect3')
			elseif not buffactive.Shell then
				send_command('Shell2')
			elseif windower.ffxi.get_player()['vitals']['hp']+500 < windower.ffxi.get_player()['vitals']['max_hp'] then
				send_command('cure4 '..windower.ffxi.get_player()['name'])
			elseif windower.ffxi.get_player()['vitals']['hp']+300 < windower.ffxi.get_player()['vitals']['max_hp'] then
				send_command('cure3 '..windower.ffxi.get_player()['name'])
			else
				send_command('slu;gs equip sets.idle.PDT')
			end
		end
	end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if player.indi and not classes.CustomIdleGroups:contains('Indi')then
		classes.CustomIdleGroups:append('Indi')
		handle_equipping_gear(player.status)
	elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
		classes.CustomIdleGroups:clear()
		handle_equipping_gear(player.status)
	end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
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
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
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
    set_macro_page(1, 6)
end
