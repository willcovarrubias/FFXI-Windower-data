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
    include('Kyouhei-Include.lua')
	state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false

	send_command('alias sil input /ma "silence" <t>')
	
	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias dex input /ma "boost-dex" <me>')
	send_command('alias str input /ma "boost-str" <me>')
	send_command('alias mind input /ma "boost-dex" <me>')
	send_command('alias vit input /ma "boost-vit" <me>')
	send_command('alias int input /ma "boost-int" <me>')
	send_command('alias agi input /ma "boost-agi" <me>')
	
	send_command('alias p5 input /ma "Protect V" <t>')
	send_command('alias s5 input /ma "shell V" <t>')
	
	send_command('alias aus input /ma "auspice" <me>')
	send_command('alias bene input /ja "benediction" <me>')
	send_command('alias ds input /ja "Divine Seal" <me>')
	send_command('alias dc input /ja "Divine Caress" <me>')
	send_command('alias sac input /ja "Sacrosanctity" <me>')
	send_command('alias asy input /ja "Asylum" <me>')
	send_command('alias dev input /ja "devotion" <t>')
	send_command('alias mat input /ja "martyr" <t>')
	
	send_command('alias mb input /ws "mystic boon" <t>')
	
	send_command('alias cel input /item "Rubicund Cell" <t>; input /item "Cobalt Cell" <t>; input /item "Phase Displacer" <t>;')
	send_command('alias dis input /item "Phase Displacer" <t>; ')
	send_command('alias atk input /attack <bt>; ')
	
	
	send_command('alias b1 input /ma "banish" <t>')
	send_command('alias b2 input /ma "banish II" <t>')
	send_command('alias b3 input /ma "banish III" <t>')
	send_command('alias aqu input /ma "aquaveil" <me>')
	send_command('alias asy input /ja "asylum" <me>')
	send_command('alias key input /item "Forbidden Key" <t>; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias rem input /item "Remedy" <me>')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "Slow" <t>')
	send_command('bind !F2 input /ma "Paralyze" <t>')
	send_command('bind !F3 input /ma "Silence" <t>')
	send_command('bind !F4 input /ma "Addle" <t>')
	send_command('bind !F5 input /ma "Blind" <t>')
	send_command('bind !F6 input /ma "Poison" <t>')
	send_command('bind !F7 input /ma "Repose" <t>')
	send_command('bind !F8 input /ma "reraise IV" <me>')
	send_command('bind !F9 input /ma "Cura" <me>')
	send_command('bind !F10 input /ma "Cura II" <me>')
	send_command('bind !F11 input /ma "Cura III" <me>')
	send_command('bind !F12 input /ma "Arise" <t>')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Protectra V" <me>')
	send_command('bind ^F2 input /ma "Shellra V" <me>')
	send_command('bind ^F3 input /ma "Blink" <me>')
	send_command('bind ^F4 input /ma "Stoneskin" <me>')
	send_command('bind ^F5 input /ma "Barfira" <me>')
	send_command('bind ^F6 input /ma "Barblizzara" <me>')
	send_command('bind ^F7 input /ma "Baraera" <me>')
	send_command('bind ^F8 input /ma "Barstonra" <me>')
	send_command('bind ^F9 input /ma "Barthundra" <me>')
	send_command('bind ^F10 input /ma "Barwatera" <me>')
	send_command('bind ^F11 input /ma "sacrifice" <t>')
	send_command('bind ^F12 input /ma "esuna" <me>')

	send_command('bind @F1 input /ma "poisona" <t>')
	send_command('bind @F2 input /ma "blindna" <t>')
	send_command('bind @F3 input /ma "silena" <t>')
	send_command('bind @F4 input /ma "stona" <t>')
	send_command('bind @F5 input /ma "viruna" <t>')
	send_command('bind @F6 input /ma "cursna" <t>')
	send_command('bind @F7 input /ma "Cure" <t>')
	send_command('bind @F8 input /ma "Cure II" <t>')
	send_command('bind @F9 input /ma "Cure V" <t>')
	send_command('bind @F10 input /item "Echo Drops" <me>')
	send_command('bind @F11 input /ma "sneak" <t>')
	send_command('bind @F12 input /ma "invisible" <t>')
	
	send_command('bind @1 input /ma "Cure VI" <t>')
	send_command('bind @2 input /ma "Curaga" <t>')
	send_command('bind @3 input /ma "Curaga II" <t>')
	send_command('bind @4 input /ma "Curaga III" <t>')
	send_command('bind @5 input /ma "Curaga IV" <t>')
	send_command('bind @6 input /ma "BarSleepra" <me>')
	send_command('bind @7 input /ma "barpoisonra" <me>')
	send_command('bind @8 input /ma "barparalyzra" <me>')
	send_command('bind @9 input /ma "barblindra" <me>')
	send_command('bind @0 input /ma "Sleepga" <t>')
	send_command('bind @- input /ma "Sleep II" <t>')
	send_command('bind @= input /ja "Benediction" <me>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ma "aurorastorm" <me>')
	send_command('bind !2 input /ma "regen IV" <t>')
	send_command('bind !3 input /ma "Cure III" <t>')
	send_command('bind !4 input /ma "Cure IV" <t>')
	send_command('bind !5 input /ma "Haste" <t>')
	send_command('bind !6 input /ja "accession" <me>')
	send_command('bind !7 input /ma "Erase" <t>')
	send_command('bind !8 input /ma "Boost-str" <me>')
	send_command('bind !9 input /ma "Boost-int" <me>')
	send_command('bind !0 input /ma "auspice" <me>')
	send_command('bind !- input /ja "divine caress" <me>')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ja "light arts" <me>')
	send_command('bind ^2 input /ja "Afflatus Solace" <me>')
	send_command('bind ^3 input /ja "Afflatus Misery" <me>')
	send_command('bind ^4 input /ja "Sublimation" <me>')
	send_command('bind ^5 input /ma "paralyna" <t>')
	send_command('bind ^6 input /ja "celerity" <me>')
	send_command('bind ^7 input /ja "penury" <me>')
	send_command('bind ^8 input /ma "Flash" <t>')
	send_command('bind ^9 input /ma "Repose" <t>')
	send_command('bind ^0 input /ja "sacrosanctity" <me>')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')
	
	
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
		main={name="Yagrush", priority=16}, 
		sub={name="Genmei Shield", priority=15},
		ammo="Sapience orb",
        head="Vanya Hood",
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        body="Inyanga Jubbah +2",
		hands="Fanatic Gloves",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
        back=gear.AlaunusCape_Magic,
		waist="Witful Belt",
		legs=gear.chironicHose_FC,
		feet=gear.chironicSlippers_FC
	}
    
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
	
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		legs="Ebers pantaloons +1"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		neck="Aceso's choker +1",
		feet="Hygieia Clogs +1", 
		ear1="Nourishing earring +1",
		ear2="Mendicant's earring"
	})
	
	sets.precast.FC["Full Cure"] = set_combine(sets.precast.FC['Healing Magic'], {
		feet="Hygieia Clogs +1", 
		ear1="Nourishing earring +1",
		ear2="Mendicant's earring"
	})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +3"}
	
    sets.precast.JA.Afflatus = {body="Ebers Bliaud +1", back="Mending Cape"}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	
	--Default WS MND
    sets.precast.WS = {
        head="Ayanmo zucchetto +2",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo manopolas +2",
		ring1="Cacoethic Ring +1",
		ring2="Apate Ring",
        back=gear.AlaunusCape_Meele,
		waist="Fotia Belt",
		legs="Ayanmo cosciales +2",
		feet="Ayanmo gambieras +2"
	}
	
	--WS MAB Based
    sets.precast.WS['Flash Nova'] = {
		ammo="Pemphredo Tathlum",
        head=gear.chironicHat_Magic,
		neck="Saevus pendant +1",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body="Chironic Doublet",
		hands=gear.chironicGloves_Magic,
		ring1="Strendu ring",
		ring2="Shiva Ring +1",
        back=gear.AlaunusCape_MAB,
		waist="Refoccilation Stone",
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	--WS 85% MND Fotia
	sets.precast.WS['Realmrazer'] = {
        head="Ayanmo zucchetto +2",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Dominance earring +2",
        body="Ayanmo corazza +2",
		hands="Ayanmo Manopolas +2",
		ring1="Cacoethic Ring +1",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Fotia Belt",
		legs="Ayanmo cosciales +2",
		feet="Ayanmo Gambieras +2"
	}
	
	--WS 70mnd 30Str
	sets.precast.WS['Mystic Boon'] = {
        head="Ayanmo zucchetto +2",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Regal Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo Manopolas +2",
		ring1="Ifrit ring",
		ring2="Rufescent ring",
        back=gear.AlaunusCape_Magic,
		waist="Fotia Belt",
		legs="Ebers pantaloons +1",
		feet="Piety duckbills +2"
	}
	
	
	--70% Mnd/ 30% Str
	sets.precast.WS['Black Halo'] = {
        head="Telchine Cap",
		neck="Imbodla necklace",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo Manopolas +2",
		ring1="Ifrit ring",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Luminary sash",
		legs="Ebers pantaloons +1",
		feet="Chironic slippers"
	}
	
	
	--Gorget	
	sets.precast.WS['Hexastrike'] = {	
        head="Ayanmo zucchetto +2",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo Manopolas +2",
		ring1="Cacoethic Ring +1",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Fotia Belt",
		legs="Ayanmo cosciales +2",
		feet="Ayanmo gambieras +2"
	}
		
    -- Midcast Sets
    
    -- Cure sets

    sets.midcast.CureSolace = {
		main={name="Queller rod", priority=16},
		sub= {name="Genbu's Shield", priorty=15},
		ammo="Hydrocera",
        head="Kaykaus mitra",
		neck="Incanter's torque",
		ear1="Novia Earring",
		ear2="Glorious Earring",
        body="Ebers Bliaud +1",
		hands="Kaykaus cuffs +1",
		ring1="Persis Ring",
		ring2="Stikini Ring +1",
        back=gear.AlaunusCape_Magic,
		waist=gear.ElementalObi,
		legs="Ebers pantaloons +1",
		feet="Kaykaus Boots +1"
	}

    sets.midcast.Cure = {
		main={name="Queller rod", priority=16},
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Hydrocera",
        head="Inyanga tiara +2",
		neck="Sanctity Necklace",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
        body="Ebers Bliaud +1",
		hands="Telchine gloves",
		ring1="Meridian ring",
		ring2="Ilabrat ring",
        back="Solemnity cape",
		waist="Porous rope",
		legs="Piety Pantaloons +1",
		feet="Piety Duckbills +2"
	}
	
    sets.midcast['Full Cure'] = {
		main={name="Queller rod", priority=16},
		sub= {name="Genbu's Shield", priorty=15},
		ammo="Hydrocera",
        head="Kaykaus mitra",
		neck="Incanter's torque",
		ear1="Novia Earring",
		ear2="Glorious Earring",
        body="Ebers Bliaud +1",
		hands="Kaykaus cuffs +1",
		ring1="Haoma's Ring",
		ring2="Stikini Ring +1",
        back=gear.AlaunusCape_Magic,
		waist=gear.ElementalObi,
		legs="Ebers pantaloons +1",
		feet="Kaykaus Boots +1"
	}
	
	sets.midcast.Impact = {
		main={name="Queller rod", priority=16},
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Pemphredo tathlum",
		head="",
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body="Twilight Cloak",
		hands=gear.chironicGloves_Magic,
		ring1="Mujin Band",
		ring2="Archon Ring",
        back=gear.AlaunusCape_MAB,
		waist=gear.ElementalObi,
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	
    sets.midcast.Curaga = {
		main={name="Queller rod", priority=16},
		sub={name="Thuellaic Ecu +1", priority=15},
		ammo="Pemphredo Tathlum",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Glorious Earring",
        body="Chironic doublet",
		hands="Kaykaus cuffs +1",
		ring1="Lebeche Ring",
		ring2="Persis Ring",
        back="Mending Cape",
		waist=gear.ElementalObi,
		legs="Ebers pantaloons +1",
		feet="Kaykaus Boots +1"
	}
	
	sets.midcast.conserve = {
		main={name="Grioavolr", priority=16},
		sub={name="Giuoco Grip", priority=15},
		ammo="Pemphredo Tathlum",
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
        body="Chironic Doublet",
        back="Solemnity cape",
		waist="Austerity Belt +1",
		legs="Vanya slops",
		feet="Kaykaus Boots +1"
	}
	
	sets.midcast['Arise'] = sets.midcast.conserve
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve
	sets.midcast.Recall = sets.midcast.conserve
	
    sets.midcast.CureMelee = {
        head="Orison Cap +2",
		neck="Sanctity Necklace",
		ear1="Odnowa Earring",
		ear2="Odnowa Earring +1",
        body="Ebers Bliaud +1",
		hands="Ebers Mitts +1",
		ring1="Meridian ring",
		ring2="Stikini Ring +1",
        back="Oretania's Cape +1",
		waist=gear.ElementalObi,
		legs="Piety Pantaloons +1",
		feet="Piety Duckbills +2"
	}

    sets.midcast.Cursna = {
		main={name="Yagrush", priority=16}, 
		sub={name="Genmei Shield", priority=15},
        head="Kaykaus mitra",
		neck="Malison Medallion",
        body="Ebers Bliaud +1",
		hands="Fanatic Gloves",
		ring1="Haoma's ring",
		ring2="Haoma's ring",
        back=gear.AlaunusCape_Magic,
		legs="Theophany pantaloons +3",
		feet="Vanya clogs"
	}

    sets.midcast.StatusRemoval = {
        main={name="Yagrush", priority=16}, 
		sub={name="Genmei Shield", priority=15}, 
	}
	
	
    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
		main={name="Gada", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
        head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Calamitous earring",
		ear2="Andoaa Earring",
        body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		ring2="Stikini Ring +1",
        back="Mending Cape",
		waist="Olympus Sash",
		legs="Piety Pantaloons +1",
		feet=gear.telchinePigaches_Enhancing
	}
	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Stone Gorget",
		ear1="Earthcry Earring",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})
	
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.midcast.Flurry = sets.midcast.Haste
	sets.midcast.Refresh = sets.midcast.Haste
	sets.midcast.Phalanx = sets.midcast.Haste
	sets.midcast.Sneak = sets.midcast.Haste
	sets.midcast.Invisible = sets.midcast.Haste

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],{
		Main={name="Vadose Rod", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		head="Chironic hat",
		hands="Telchine Gloves",
		legs="Shedir Seraweels",
		feet=gear.telchinePigaches_Enhancing
	})

    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
		head="Telchine Cap",
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet="Ebers Duckbills +1"
	})

    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
		main={name="Beneficus", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
        head="Ebers Cap +1",
		neck="Incanter's Torque",
        body="Telchine Chasuble",
		hands="Ebers Mitts +1",
		waist="Olympus Sash",
		legs="Piety Pantaloons +1",
		feet="Ebers Duckbills +1"
	})
	
	sets.midcast['Barsleepra'] = sets.midcast.BarElement
	sets.midcast['Barpoisonra'] = sets.midcast.BarElement
	sets.midcast['Barparalyna'] = sets.midcast.BarElement
	sets.midcast['Barblindra'] = sets.midcast.BarElement
	sets.midcast['Barvira'] = sets.midcast.BarElement
	sets.midcast['Barpetra'] = sets.midcast.BarElement
	sets.midcast['Baramnesra'] = sets.midcast.BarElement
	sets.midcast['Barsilencra'] = sets.midcast.BarElement
	
    sets.midcast.Regen = set_combine(sets.midcast.conserve, {
		main={name="Bolelabunga", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
        head="Inyanga tiara +2", 
		body="Piety Briault +3",
		hands="Ebers Mitts +1",
		legs="Theophany pantaloons +3",
		feet=gear.telchinePigaches_Enhancing	
	})

    sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {
		main={name="Gada", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		ring1="Sheltered Ring",
		feet="Piety Duckbills +2",
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,	
	})
	
	sets.midcast.Protect = sets.midcast.Protectra

    sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {
		main={name="Gada", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		ring1="Sheltered Ring",
		legs="Piety Pantaloons +1",
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		feet=gear.telchinePigaches_Enhancing			
	})

	sets.midcast.Shell = sets.midcast.Shellra
	
    sets.midcast['Divine Magic'] = {
		main={name="Divinity", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Hydrocera",
        head="Inyanga tiara +2",
		neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Regal Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Stikini Ring +1",
		ring2="Persis ring",
        back=gear.AlaunusCape_Magic,
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet="Kaykaus Boots +1"
	}
  
    sets.midcast['Holy II'] = {
		main={name="Grioavolr", priority=16},
		sub={name="Alber Strap", priority=15}, 
		ammo="Pemphredo Tathlum",
        head=gear.chironicHat_Magic,
		neck="Saevus pendant +1",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body="Chironic Doublet",
		hands=gear.chironicGloves_Magic,
		ring1="Mujin Band",
		ring2="Strendu Ring",
        back=gear.AlaunusCape_MAB,
		waist=gear.ElementalObi,
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	  sets.midcast.Banish = {
		main={name="Queller rod", priority=16},
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Pemphredo Tathlum",
        head=gear.chironicHat_Magic,
		neck="Saevus pendant +1",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body="Chironic Doublet",
		hands=gear.chironicGloves_Magic,
		ring1="Mujin Band",
		ring2="Strendu Ring",
        back=gear.AlaunusCape_MAB,
		waist=gear.ElementalObi,
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	
	sets.midcast.Holy = sets.midcast.Banish
   
 
	sets.midcast['Elemental Magic'] = {
		main={name="Queller rod", priority=16},
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Pemphredo tathlum",
        head="Inyanga tiara +2",
		neck="Sanctity Necklace",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Strendu Ring",
		ring2="Shiva Ring +1",
        back=gear.AlaunusCape_MAB,
		waist=gear.ElementalObi,
		legs="Inyanga Shalwar +2",
		feet=gear.chironicSlippers_Magic 
	}	
	
	sets.midcast.sleep = {
		main={name="Yagrush", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Pemphredo tathlum",
        head="Inyanga tiara +2",
		neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Regal Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Kishar Ring",
		ring2="Stikini RIng +1",
        back=gear.AlaunusCape_Magic,
		waist="Luminary Sash",
		legs="Theophany Pantaloons +3",
		feet=gear.chironicSlippers_Magic 
	}	
		
    sets.midcast['Dark Magic'] = {
		main={name="Yagrush", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Pemphredo tathlum",
        head="Inyanga tiara +2",
		neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Regal Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Stikini Ring +1",
		ring2="Evanescence ring",
        back=gear.AlaunusCape_Magic,
		waist="Luminary Sash",
		legs="Theophany Pantaloons +3",
		feet=gear.chironicSlippers_Magic 
	}

	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		neck="Incanter's torque", 
		ring1="Evanescence Ring",
		ring2="Archon Ring",
		waist="Fucho-no-Obi"
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		neck="Incanter's torque", 
		ring1="Evanescence Ring",
		ring2="Archon Ring",
		waist="Fucho-no-Obi"
	})
	
	
	
    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main={name="Yagrush", priority=16}, 
		sub={name="Ammurapi Shield", priority=15}, 
		ammo="Hydrocera",
        head="Inyanga's Tiara +2",
		neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Regal Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Kishar ring",
		ring2="Stikini Ring +1",
        back=gear.AlaunusCape_Magic,
		waist="Luminary sash",
		legs="Theophany Pantaloons +3",
		legs="Theophany Pantaloons +3",
		feet=gear.chironicSlippers_FC
	}

    sets.midcast.IntEnfeebles = {
		main={name="Yagrush", priority=16}, 
		sub={name="Ammurapi Shield", priority=15},  
		ammo="Pemphredo tathlum",
        head="Inyanga's Tiara +2",
		neck="Incanter's Torque",
		ear1="Dignitary's Earring",
		ear2="Regal Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Kishar ring",
		ring2="Stikini Ring +1",
        back=gear.AlaunusCape_Magic,
		waist="Luminary Sash",
		legs="Inyanga Shalwar +2",
		feet=gear.chironicSlippers_Magic 
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	
    sets.idle = {
		main={name="Bolelabunga", priority=16}, 
		sub={name="Genmei Shield", priority=15}, 
		ammo="Staunch Tathlum",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Shamash Robe",
		hands=gear.chironicGloves_Ref,
		ring1="Defending Ring",
		ring2="Stikini Ring +1",
        back="Moonbeam Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Herald's Gaiters"
	}

    sets.idle.Refresh = {
		main={name="Terra's Staff", priority=16},  
		sub={name="Oneiros Grip", priority=15}, 
		ammo="Homiliary",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Shamash Robe",
		hands=gear.chironicGloves_Ref,
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Moonbeam Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet=gear.chironicSlippers_Ref
	}	
		
    sets.idle.PDT = {
		main={name="Bolelabunga", priority=16}, 
		sub={name="Genmei Shield", priority=15},
		ammo="Staunch Tathlum",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Odnowa earring +1",
		ear2="Etiolation Earring",
        body="Shamash Robe",
		hands=gear.chironicGloves_Ref,
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Moonbeam Cape",
		waist="Slipor sash",
		legs="Inyanga Shalwar +2",
		feet="Ayanmo gambieras +2"
	}
	
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
		Ammo="Floestone",
        head="Ayanmo zucchetto +2",
		neck="Lissome Necklace",
		ear1="Brutal Earring",
		ear2="Telos Earring",
        body="Ayanmo corazza +2",
		hands="Ayanmo manopolas +2",
		ring1="Ilabrat Ring",
		ring2="Petrov Ring",
        back=gear.AlaunusCape_Meele,
		waist="Windbuffet Belt +1",
		legs="Ayanmo cosciales +2",
		feet="Ayanmo gambieras +2"
	}
	
	--sets.latent_refresh = {waist="Fucho-no-Obi"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Divine Caress'] = {
		hands="Ebers Mitts +1",
		back="Mending Cape"
	}
	
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

-------------------------------------------------------------------------------------------------------------------wr
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

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end

function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Pythia Sash +1"
		if spell.element == world.weather_element or
		spell.element == world.day_element then 
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == 'Divine Magic' then
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

function job_post_midcast(spell, action, spellMap, eventArgs)
    if buffactive['Divine Caress'] then
    equip(sets.buff['Divine Caress'])
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
