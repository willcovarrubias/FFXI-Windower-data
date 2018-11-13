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
    include('Nimla-Include.lua')
	send_command('alias radial input /equip feet "Bagua Sandals"; /ja "Radial Arcana"; /input /wait 1; input /equip feet "Bagua Sandals";')
	send_command('alias echos input /item "Echo Drops" <me>; input /echo  ECHO DROPS;')
	send_command('alias mirrors input /item "Mirror\'s Tonic"; input /echo  Petrify screen;')
	send_command('alias terror input /item "Steadfast Tonic"; input /echo  Terror Screen;')
	send_command('alias doom input /item "Savior\'s Tonic"; input /echo  Doom Screen;')
	send_command('alias MMPP input /ws "Moonlight"; input /echo  Moonlight;')
	send_command('alias aqu input /ma "aquaveil" <me>')
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')

	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	send_command('alias fac input /equip ring2 "facility ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias key input /item "Forbidden Key" <t>; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias rem input /item "Remedy" <me>') 
	
	send_command('alias fc input //ja "Full Circle"')
	
	send_command('alias MMPP input /ws "Moonlight"; input /echo  Moonlight;')
	
	send_command('alias ilan input /ma "indi-Languor" <t>')
	send_command('alias glan input /ma "Geo-Languor" <t>')
	send_command('alias imal input /ma "Indi-Malaise" <t>')
	send_command('alias gmal input /ma "Geo-Malaise" <t>')
	send_command('alias ivex input /ma "Indi-Vex" <t>')
	send_command('alias gvex input /ma "Geo-Vex" <t>')
	send_command('alias ihas input /ma "Indi-Haste" <t>')
	send_command('alias ghas input /ma "Geo-Haste" <t>')
	send_command('alias ifad input /ma "Indi-fade" <t>')
	send_command('alias gfad input /ma "Geo-fade" <t>')
	send_command('alias ifen input /ma "Indi-fend" <t>')
	send_command('alias gfen input /ma "Geo-fend" <t>')
	send_command('alias ifra input /ma "Indi-Frailty" <t>')
	send_command('alias gfra input /ma "Geo-Frailty" <t>')		
	send_command('alias iacu input /ma "Indi-Acumen" <t>')
	send_command('alias gauc input /ma "Geo-Acumen" <t>')
	send_command('alias itor input /ma "Indi-Torpor" <t>')
	send_command('alias gtor input /ma "Geo-Torpor" <t>')
	send_command('alias ifoc input /ma "Indi-focus" <t>')
	send_command('alias gfoc input /ma "Geo-focus" <t>')
	send_command('alias iref input /ma "Indi-Refresh" <t>')
	send_command('alias gref input /ma "Geo-Refresh" <t>')
	send_command('alias ifur input /ma "Indi-Fury" <t>')
	send_command('alias gfur input /ma "Geo-Fury" <t>')
	send_command('alias ipre input /ma "Indi-Precision" <t>')
	send_command('alias gpre input /ma "Geo-Precision" <t>')
	send_command('alias ibar input /ma "Indi-Barrier" <t>')
	send_command('alias gbar input /ma "Geo-Barrier" <t>')
	send_command('alias iwil input /ma "Indi-Wilt" <t>')
	send_command('alias gwil input /ma "Geo-Wilt" <t>')
	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'NOMB', 'Merit')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	
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
	send_command('bind !F10 input /item "echo drops" <me>')
	send_command('bind !F11 input /item "holy water" <me>')
	send_command('bind !F12 input /item "remedy" <me>')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Phalanx" <me>')
	send_command('bind ^F4 input /ma "Aquaveil" <me>')
	send_command('bind ^F5 input /ma "Klimaform" <me>')
	send_command('bind ^F6 input /ma "Dispel" <t>')
	send_command('bind ^F7 input /ma "indi-fury" <me>')
	send_command('bind ^F8 input /ma "Geo-Frailty" <t>')
	send_command('bind ^F9 input /ma "indi-attunement" <t>')
	send_command('bind ^F10 input /ma "indi-precision" <me>')
	send_command('bind ^F11 input /ma "geo-fend" <me>')
	send_command('bind ^F12 input /ma "indi-fade" <me>')

	send_command('bind @F1 input /ma "poisona" <t>')
	send_command('bind @F2 input /ma "blindna" <t>')
	send_command('bind @F3 input /ma "silena" <t>')
	send_command('bind @F4 input /ma "stona" <t>')
	send_command('bind @F5 input /ma "viruna" <t>')
	send_command('bind @F6 input /ma "cursna" <t>')
	send_command('bind @F7 input /ma "Cure" <t>')
	send_command('bind @F8 input /ma "Cure II" <t>')
	send_command('bind @F9 input /ma "Cure IV" <t>')
	send_command('bind @F10 input /item "Echo Drops" <me>')
	send_command('bind @F11 input /ma "sneak" <t>')
	send_command('bind @F12 input /ma "invisible" <t>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ma "Cure" <t>')
	send_command('bind !2 input /ma "Cure II" <t>')
	send_command('bind !3 input /ma "Cure III" <t>')
	send_command('bind !4 input /ma "Cure IV" <t>')
	send_command('bind !5 input /ma "haste" <t>')
	send_command('bind !6 input /ma "indi-langour" <t>')
	send_command('bind !7 input /ma "refresh" <t>')
	send_command('bind !8 input /ma "Blizzard" <t>')
	send_command('bind !9 input /ma "Blizzard II" <t>')
	send_command('bind !0 input /ma "Blizzard III" <t>')
	send_command('bind !- input /ma "Blizzard IV" <t>')
	send_command('bind != input /ma "Blizzard V" <t>')

-- Misc CTRL	
	send_command('bind ^1 input /ja "full circle" <me>')
	send_command('bind ^2 input /ja "radial arcana" <me>')
	send_command('bind ^3 input /ja "dematerialize" <me>')
	send_command('bind ^4 input /ja "life cycle" <me>')
	send_command('bind ^5 input /ma "flurry" <t>')
	send_command('bind ^6 input /ma "Slow" <t>')
	send_command('bind ^7 input /ma "haste" <t>')
	send_command('bind ^8 input /ma "Thunder" <t>')
	send_command('bind ^9 input /ma "Thunder II" <t>')
	send_command('bind ^0 input /ma "Thunder III" <t>')
	send_command('bind ^- input /ma "Thunder IV" <t>')
	send_command('bind ^= input /ma "Thunder V" <t>')
	
	send_command('bind @1 input /ma "Paralyna" <t>')
	send_command('bind @2 input /ma "Silena" <t>')
	send_command('bind @3 input /ma "Blindna" <t>')
	send_command('bind @4 input /ma "Cursna" <t>')
	send_command('bind @5 input /ma "Stona" <t>')
	send_command('bind @6 input /ma "Poisona" <t>')
	send_command('bind @7 input /ma "Viruna" <t>')
	send_command('bind @8 input /ma "Adloquium" <t>')
	send_command('bind @9 input /ma "Regen V" <t>')
	send_command('bind @0 input /ja "Erase" <t>')
	send_command('bind @- input /ja "blaze of glory" <me>')
	send_command('bind @= input /ja "entrust" <me>')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
		main="Solstice",
		sub="Genbu's Shield",
        head= gear.merlinicHood_FC,
		neck="Orunmila's Torque",
		ear1="Etiolation earring",
		ear2="Loquacious Earring",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		waist="Channeler's Stone",
        back="Lifestream Cape",
		legs="Geomancy Pants",
		feet=gear.merlinicCrackows_FC
	}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {
	head="Befouled crown"
	})

	
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		body="Heka's kalasiris", 
		ear2="Mendicant's earring"
	})

	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		body="Heka's kalasiris", 
		ear2="Mendicant's earring"
	})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, { 
		hands="Bagua Mitaines"
	})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines"}
    sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic", back="Nantosuelta's Cape"}
	sets.precast.JA['Bolster'] = {body="Bagua tunic"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
    sets.precast.JA['Primeval Zeal'] = {head="Bagua Galero"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood"}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	
	
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	
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
		ear2="Friomisi Earring",
        body="Jhakri Robe +1",
		hands="Otomi Gloves",
		ring1="Strendu ring",
		ring2="Vertigo Ring",
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
		
	sets.precast.WS['Myrkr'] = {
		ammo="Ghastly Tathlum +1",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Moonshade Earring",
		ear2="Evans Earring",
		body=gear.merlinicJubbah_Magic,
		hands="Telchine Gloves",
		ring1="Vocane Ring",
		ring2="Sangoma Ring",
		back=gear.Taranus_MPFC,
		waist="Fucho-no-Obi",
		legs=gear.psyclothLappas_FC,
		feet=gear.merlinicCrackows_Magic
	}	
		
		

    -- Midcast Sets
    
    -- Cure sets
	
	-- Cure Omen--
	--[[sets.midcast.Cure = {
		main="Tamaxchi", sub="Culminus", head="Bagua galero", neck="Sanctity necklace", ear1="Odnowa Earring",
		ear2="Odnowa Earring +1", body="Bagua tunic", hands="Geomancy mitaines", ring1="Haoma's Ring",
		ring2="Eihwaz Ring", back="Lifesteam Cape", waist="Porous Rope", legs="Bagua pants", feet="Azimuth Gaiters"}
	]]--
	---Normal Cure--
    
	sets.midcast.Cure = {
		main="Solstice", sub="Genbu's Shield", head="Vanya Hood", neck="Incanter's Torque", ear1="Novia Earring", 
		ear2="Mendicant's Earring", body="Vrikodara Jupon", ring1="Lebeche Ring", ring2="Sirona's Ring",
        back="Oretania's Cape +", waist=gear.ElementalObi, legs="Gyve Trousers", feet="Vanya clogs"}

    sets.midcast.Curaga = {
		main="Tamaxchi", 
		sub="Genbu's Shield", 
		head="Vanya Hood", 
		neck="Incanter's Torque", 
		ear1="Novia Earring",
		ear2="Mendicant's Earring", 
		body="Heka's kalasiris", 
		ring1="Haoma's Ring", 
		ring2="Sirona's Ring",
        back="Vita Cape", 
		waist=gear.ElementalObi, 
		legs="Vanya Slops", 
		feet="Vanya clogs"
	}
	
	sets.midcast.conserve = {
		main="Solstice",
		sub="Thuellaic Ecu +1",
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
        body="Jhakri robe +1",
        back="Vita Cape",
		waist="Austerity Belt",
		legs="Vanya slops",
		feet="Vanya Clogs"
	}
	
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve
	
	
    sets.midcast.CureMelee = {
        head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
        body="Heka's kalasiris", 
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Vita Cape",
		waist="Pythia sash +1",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}

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
		main="Gada",
		sub="Ammurapi Shield",
        head="Befouled crown",
		neck="Incanter's Torque",
		ear1="Calamitous earring",
		ear2="Andoaa Earring",
        body="Anhur Robe",
		hands="Inyanga Dastanas +1",
        back="Mending Cape",
		waist="Pythia Sash",
		legs="Piety Pantaloons +1",
		feet="Orison Duckbills +2"
	}
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Stone Gorget",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{
		Main="Vandose Rod",
		sub="Ammurapi Shield",
		head="Chironic hat",
		legs="Shedir Seraweels"
	})
	
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
	
    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
        head="Orison Cap +2",
		neck="Colossus's Torque",
        body="Orison Bliaud +2",
		hands="Orison Mitts +2",
        back="Mending cape",
		waist="Olympus Sash",
		legs="Piety Pantaloons",
		feet="Orison Duckbills +2"
	})

    sets.midcast.Regen = {
        head="Inyanga tiara +1", 
		body="Piety Briault",
		hands="Orison Mitts +2",
        legs="Piety Pantaloons"
	}

    sets.midcast.Protectra = {
		ring1="Sheltered Ring",
		feet="Telchine pigaches",
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine Gloves",
		legs="Telchine braconi"	
	}

    sets.midcast.Shellra = {
		ring1="Sheltered Ring",
		legs="Telchine braconi",
		head="Telchine Cap",
		body="Telchine chasuble",
		hands="Telchine Gloves",
		feet="Telchine pigaches"			
	}

	------
	
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
        back="Izdubar Mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
    sets.midcast['Divine Magic'] = {
        head="Inyanga Tiara +1",
		neck="Eddy Necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga Jubbah +1",
		hands="Vanya Cuffs",
		ring1="Perception ring",
		ring2="Aquasoul Ring",
        back="Izdubar Mantle",
		waist="Witch's Sash",
		legs="Vanya Slops",
		feet="Vanya Clogs"
	}
  
    sets.midcast.Banish = {
        head="Inyanga Tiara +1",
		neck="Mizukage-no-Kubikazari",
		ear1="Barkarole earring",
		ear2="Hecate's earring",
        body="Vanya Robe",
		hands="Vanya Cuffs",
		ring1="Strendu Ring",
		ring2="Acumen ring",
        back="Nantosuelta's Cape",
		waist="Witch's Sash",
		legs="Vanya Slops",
		feet="Vanya Clogs"
	}
	
	sets.midcast.Holy = {
        head="Inyanga Tiara +1",
		neck="Mizukage-no-Kubikazari",
		ear1="Barkarole earring",
		ear2="Hecate's earring",
        body="Vanya Robe",
		hands="Vanya Cuffs",
		ring1="Strendu Ring",
		ring2="Acumen ring",
        back="Lugh's Cape",
		waist="Witch's Sash",
		legs="Vanya Slops",
		feet="Vanya Clogs"
	}
   
 
	sets.midcast['Elemental Magic'] = {
        main="Solstice", 
		sub="Culminus",
        head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric Gages",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
        back="Izdubar Mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}

	sets.midcast['Elemental Magic'].NOMB = {
        main="Solstice", 
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,
		neck="Saevus Pendant +1",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Strendu Ring",
        back="Izdubar Mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast['Elemental Magic'].Merit = {
        main="Solstice", 
		sub="Ammurapi Shield",
        head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Seidr Cotehardie",
		hands="Jhakri Cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
        back="Izdubar Mantle",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}	
	
	
	sets.midcast.sleep = {
		main="Solstice", 
		sub="Ammurapi Shield",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Izdubar Mantle",
		waist="Casso Sash",
		legs="Jhakri slops +1",
		feet=gear.merlinicCrackows_Macc
	}	
		
	sets.midcast.Geomancy = set_combine(sets.midcast.conserve, {
		main="Solstice",
		sub="Thuellaic Ecu +1",
		range="Dunna",
		head="Azimuth Hood",
		neck="Incanter's Torque",
		body="Bagua Tunic",
		hands="Geomancy mitaines",
		back="Lifestream Cape",
		legs="Bagua Pants",
		feet="Azimuth Gaiters"
	})	

	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.conserve, {
		main="Solstice",
		sub="Thuellaic Ecu +1",
		range="Dunna",
		head="Azimuth Hood",
		neck="Incanter's Torque",
		body="Bagua Tunic",
		hands="Geomancy mitaines",
		back="Lifestream Cape",
		legs="Bagua Pants",
		feet="Azimuth Gaiters"
	})
	
		
    sets.midcast['Dark Magic'] = {
		main="Solstice", 
		sub="Ammurapi Shield",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Izdubar Mantle",
		waist="Casso Sash",
		legs="Vanya Slops",
		feet=gear.merlinicCrackows_Macc
	}

	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		main="appetence crown",
		neck="Erra Pendant", 
		ear1="Hirudinea earring",
		ring1="Archon Ring",
		ring2="Evanscence ring",
		waist="Fucho-no-obi",
		feet=gear.merlinicCrackows_Magic
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		main="appetence crown",
		neck="Erra Pendant", 
		ear1="Hirudinea earring",
		ring1="Archon Ring",
		ring2="Evanscence ring",
		waist="Fucho-no-obi",
		feet=gear.merlinicCrackows_Magic
	})
	
	
    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Solstice", 
		sub="Ammurapi Shield",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Kishar Ring",
		ring2="Vertigo Ring",
        back="Izdubar Mantle",
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet="Jhakri pigaches +1"
	}

    sets.midcast.IntEnfeebles = {
		main="Solstice", 
		sub="Ammurapi Shield",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Kishar Ring",
		ring2="Vertigo Ring",
        back="Izdubar Mantle",
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet="Jhakri pigaches +1"
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Numen Staff", 
		sub="Achaq Grip",
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
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	
    sets.idle = {
		main="Earth Staff", 
		sub="Giuoco grip",
		range="Dunna",
		head="Azimuth Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
        body="Jhakri Robe +1",
		hands="Geomancy mitaines",
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Lifestream Cape",
		waist="Isa Belt",
		legs="Assiduity pants +1",
		feet="Azimuth Gaiters"
	}

	 sets.idle.Pet = {
		main="Terra's Staff",
		sub="Giuoco Grip",
		range="Dunna",
		head="Azimuth Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
		body="Jhakri Robe +1",         --gear.telchineChasuble_Pet,
		hands="Geomancy mitaines",
		ring1="Dark Ring",
		ring2="Defending Ring",
		back="Nantosuelta's Cape",
		waist="Isa Belt",
		legs="Assiduity pants +1",		--gear.telchineBraconi_Pet,
		feet="Azimuth Gaiters"			--gear.telchinePigaches_Pet
	}
	
	
    sets.idle.Refresh = {
		main="Solstice", 
		sub="Genbu's Shield",
		range="Dunna",
		head="Azimuth Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
        body="Jhakri Robe +1",
		hands="Geomancy mitaines",
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Lifestream Cape",
		waist="Isa Belt",
		legs="Assiduity pants +1",
		feet="Mallquis Clogs +1"	
	}	
		
    sets.idle.PDT = {
		main="Solstice", 
		sub="Genbu's Shield",
		range="Dunna",
		head="Azimuth Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
        body="Vrikodara jupon",
		hands="Geomancy mitaines",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Lifestream Cape",
		waist="Isa Belt",
		legs="Gyve Trousers",
		feet="Azimuth Gaiters +1"	
	}
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
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
	}
	
	--sets.idle.Town = {
	--head = "Magnifying Specs.",
	--neck = "Weaver's Torque",
	--body = "Weaver's Smock",
	--hands = "Weaver's Cuffs",
	--feet="Herald's Gaiters"
	--}
	
	sets.latent_refresh = {waist="Fucho-no-Obi"}

	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

--[[function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end]]--

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

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

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
