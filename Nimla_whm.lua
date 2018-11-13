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
	
	state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	
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
    state.IdleMode:options('Normal', 'Refresh', 'PDT', 'Craft')
	
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
	send_command('bind != input /ja "devotion" <t>')

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
		main="Grioavolr", 
		sub="enki strap",
		ammo="Incantor Stone",
        head="Vanya Hood",
		neck="voltsurge torque",
		neck="Baetyl Pendant",
		ear1="Etiolation earring",
		ear2="Loquacious Earring",
        body="Inyanga Jubbah +2",
		hands="fanatic gloves",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
        back="Alaunus's Cape",
		waist="Channeler's Stone",
		legs="Lengo Pants",
		feet="Chelona Boots +1",
	}
    
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
	
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
		main="Queller rod",
		sub="Sors Shield",
		ear1="Nourishing earring +1",
		ear2="Mendicant's earring",
		body="Heka's Kalasiris",
		legs="Ebers pantaloons +1",
		feet="Hygieia Clogs +1"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		ear1="Nourishing earring +1",
		ear2="Mendicant's earring",
	})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault +1"}
	
    sets.precast.JA.Afflatus = {body="Ebers Bliaud +1", back="Mending Cape"}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	
	--Default WS MND
    sets.precast.WS = {
        head="Ayanmo zucchetto +1",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +1",
		hands="Ayanmo manopolas +1",
		ring1="Cacoethic Ring +1",
		ring2="Apate Ring",
        back=gear.AlaunusCape_Meele,
		waist="Fotia Belt",
		legs="Ayanmo cosciales +1",
		feet="Ayanmo gambieras +1"
	}
	
	--WS MAB Based
    sets.precast.WS['Flash Nova'] = {
		ammo="Pemphredo Tathlum",
        head=gear.chironicHat_Magic,
		neck="Saevus pendant +1",
		ear1="Novio Earring",
		ear2="Friomisi Earring",
        body="Chironic Doublet",
		hands=gear.chironicGloves_Magic,
		ring1="Strendu ring",
		ring2="Shiva Ring +1",
        back="Alaunus's Cape",
		waist="Refoccilation Stone",
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	--WS 85% MND Fotia
	sets.precast.WS['Realmrazer'] = {
        head="Ayanmo zucchetto +1",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +1",
		hands="Ayanmo manopolas +1",
		ring1="Cacoethic Ring +1",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Fotia Belt",
		legs="Ayanmo cosciales +1",
		feet="Chironic slippers"
	}
	
	--WS 70mnd 30Str
	sets.precast.WS['Mystic Boon'] = {
        head="Befouled crown",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +1",
		hands="Ayanmo manopolas +1",
		ring1="Ifrit ring",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Fotia Belt",
		legs="Ebers pantaloons +1",
		feet="Chironic slippers"
	}
	
	
	--70% Mnd/ 30% Str
	sets.precast.WS['Black Halo'] = {
        head="Befouled crown",
		neck="Imbodla necklace",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +1",
		hands="Ayanmo manopolas +1",
		ring1="Ifrit ring",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Luminary sash",
		legs="Ebers pantaloons +1",
		feet="Chironic slippers"
	}
	
	
	--Gorget	
	sets.precast.WS['Hexastrike'] = {	
        head="Ayanmo zucchetto +1",
		neck="Fotia Gorget",
		ear1="Ishvara Earring",
		ear2="Brutal Earring",
        body="Ayanmo corazza +1",
		hands="Ayanmo manopolas +1",
		ring1="Cacoethic Ring +1",
		ring2="Rufescent ring",
        back="Alaunus's Cape",
		waist="Fotia Belt",
		legs="Ayanmo cosciales +1",
		feet="Ayanmo gambieras +1"
	}
		
		

    -- Midcast Sets
    
    -- Cure sets

    sets.midcast.CureSolace = {
		main="Queller rod",
		sub="Genbu's Shield",
		ammo="Hydrocera",
        head="Kaykaus Mitra",
		neck="Incanter's torque",
		ear1="Nourishing Earring +1",
		ear2="Glorious Earring",
        body="Ebers Bliaud +1",
		hands="Theophany Mitts +2",
		ring1="Haoma's Ring",
		ring2="Janniston Ring",
        back="Alaunus's Cape",
		waist="Hachirin-no-obi",
		legs="Orison Pantaloons +1",
		feet="Kaykaus Boots"
	}

    sets.midcast.Cure = {
		main="Queller rod",
		sub="Culminus",
		ammo="Hydrocera",
        head="Kaykaus Mitra",
		neck="Incanter's torque",
		ear1="Nourishing Earring +1",
		ear2="Glorious Earring",
        body="Ebers Bliaud +1",
		hands="Theophany Mitts +2",
		ring1="Haoma's Ring",
		ring2="Janniston Ring",
        back="Alaunus's Cape",
		waist="Hachirin-no-obi",
		legs="Ebers pantaloons +1",
		feet="Kaykaus Boots"
	}

	sets.midcast.Impact = {
		main="Queller rod",
		sub="Culminus",
		ammo="Pemphredo tathlum",
		head="",
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Novio Earring",
        body="Twilight Cloak",
		hands=gear.chironicGloves_Magic,
		ring1="Mujin Band",
		ring2="Archon Ring",
        back="Alaunus's Cape",
		waist="Hachirin-no-obi",
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	
    sets.midcast.Curaga = {
		main="Queller rod",
		sub="Genbu's Shield",
		ammo="Pemphredo Tathlum",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Nourishing Earring +1",
		ear2="Glorious Earring",
        body="Chironic doublet",
		hands="Kaykaus cuffs",
		ring1="Kuchekula ring",
		ring2="Mediator's ring",
        back="Mending Cape",
		waist="Hachirin-no-obi",
		legs="Ebers pantaloons +1",
		feet="Kaykaus Boots"
	}
	
	sets.midcast.conserve = {
		main="Grioavolr",
		sub="Giuoco Grip",
		ammo="Pemphredo Tathlum",
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
        body="Chironic doublet",
        back="Vita Cape",
		waist="Austerity Belt",
		legs="Vanya slops",
		feet="Kaykaus Boots"
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
		ring1="Eihwaz Ring",
		ring2="Sirona's Ring",
        back="Oretania's Cape +1",
		waist="Hachirin-no-obi",
		legs="Piety Pantaloons +1",
		feet="Piety Duckbills +1"
	}

    sets.midcast.Cursna = {
		main="Yagrush",
		sub="Genmei Shield",
        head="Kaykaus mitra",
		neck="Malison Medallion",
        body="Ebers Bliaud +1",
		hands="Fanatic Gloves",
		ring1="Haoma's ring",
		ring2="Haoma's ring",
        back="Alaunus's Cape",
		legs="Theophany pantaloons +2",
		legs="Theophany pantaloons +1",
		feet="Vanya clogs"
	}

    sets.midcast.StatusRemoval = {
        main="Yagrush",
		sub="Genmei Shield"
	}

	sets.buff['Perpetuance'] = set_combine(sets.midcast['Enhancing Magic'], {
        hands="Arbatel bracers"
    })
	
	
    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
		main="Gada",
		sub="Ammurapi Shield",
		head="Telchine Cap",
		neck="Incanter's Torque",
		ear1="Calamitous earring",
		ear2="Andoaa Earring",
        body="Telchine Chasuble",
		hands="Telchine Gloves",
        back="Mending Cape",
		waist="Pythia Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
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
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
	})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
	})
	
	sets.midcast.Sneak = sets.midcast.Refresh
	sets.midcast.Invisible = sets.midcast.Refresh

    sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {
		head="Telchine Cap",
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Orison Duckbills +2"
	})

    sets.midcast.BarElement = {
		main="Beneficus",
        head="Orison Cap +2",
		neck="Incanter's Torque",
        body="Ebers Bliaud +1",
		hands="Ebers Mitts +1",
        back="Mending cape",
		waist="Olympus Sash",
		legs="Piety Pantaloons +1",
		feet="Orison Duckbills +2"
	}

	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		neck="Incanter's torque", 
		ring1="Excelsis Ring",
		waist="Fucho-no-Obi"
	})
	
    sets.midcast.Regen = {
		Main="Gada",
		sub="Ammurapi Shield",
        head="Telchine Cap",
		neck="Incanter's Torque",
        body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
	}

    sets.midcast.Protectra = {
		ring1="Sheltered Ring",
		feet="Piety Duckbills +1",
		head="Telchine Cap",
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",	
	}
	
	sets.midcast.Protect = sets.midcast.Protectra

    sets.midcast.Shellra = {
		ring1="Sheltered Ring",
		legs="Piety Pantaloons +1",
		head="Telchine Cap",
		body="Telchine Chasuble",
		feet="Telchine Pigaches"		
	}

	sets.midcast.Shell = sets.midcast.Shellra
	
    sets.midcast['Divine Magic'] = {
		main="Divinity", 
		sub="Ammurapi Shield",
		ammo="Hydrocera",
        head="Inyanga Tiara +1",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga Jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Vertigo Ring",
		ring2="Leviathan ring",
        back="Alaunus's Cape",
		waist="Luminary Sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
	}
  
    sets.midcast.Banish = {
		main="Queller Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
        head=gear.chironicHat_Magic,
		neck="Sanctity Necklace",
		ear1="Novio Earring",
		ear2="Friomisi Earring",
        body="Chironic Doublet",
		hands=gear.chironicGloves_Magic,
		ring1="Mujin Band",
		ring2="Strendu Ring",
        back="Alaunus's Cape",
		waist="Hachirin-no-obi",
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
	
	sets.midcast.Holy = {
		main="Queller Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
        head=gear.chironicHat_Magic,
		neck="Sanctity Necklace",
		ear1="Novio Earring",
		ear2="Friomisi Earring",
        body="Chironic Doublet",
		hands=gear.chironicGloves_Magic,
		ring1="Mujin Band",
		ring2="Strendu Ring",
        back="Alaunus's Cape",
		waist="Hachirin-no-obi",
		legs="Gyve trousers",
		feet=gear.chironicSlippers_Magic
	}
   
 
	sets.midcast['Elemental Magic'] = {
		main="Queller Rod",
		sub="Ammurapi Shield",
		ammo="Pemphredo tathlum",
        head="Inyanga Tiara +1",
		neck="Sanctity Necklace",
		ear1="Novio Earring",
		ear2="Friomisi Earring",
        body="Inyanga Jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Vertigo Ring",
		ring2="Shiva Ring +1",
        back="Alaunus's Cape",
		waist="Hachirin-no-obi",
		legs="Inyanga Shalwar +1",
		feet="Piety Duckbills +1"
	}	
	
	sets.midcast.sleep = {
		main="Yagrush", 
		sub="Ammurapi Shield",
		ammo="Pemphredo tathlum",
        head="Inyanga Tiara +1",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Vertigo ring",
		ring2="Archon Ring",
        back="Alaunus's Cape",
		waist="Casso Sash",
		legs="Inyanga Shalwar +1",
		feet="Piety Duckbills +1"
	}	
		
    sets.midcast['Dark Magic'] = {
		main="Yagrush", 
		sub="Ammurapi Shield", 
		ammo="Pemphredo tathlum",
        head="Inyanga Tiara +1",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Vertigo ring",
		ring2="Evanescence ring",
        back="Alaunus's Cape",
		waist="Casso Sash",
		legs="Inyanga Shalwar +1",
		feet="Piety Duckbills +1"
	}

	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		head="Pixie Hairpin +1",
		neck="Incanter's torque", 
		ring1="Evanescence Ring",
		ring2="Archon Ring",
		waist="Fucho-no-Obi"
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		head="Pixie Hairpin +1",
		neck="Incanter's torque", 
		ring1="Evanescence Ring",
		ring2="Archon Ring",
		waist="Fucho-no-Obi"
	})
	
	
	
    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Yagrush", 
		sub="Ammurapi Shield",
		ammo="Hydrocera",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Nourishing earring +1",
		ear2="Pensee earring",
        body="Inyanga Jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Kishar ring",
		ring2="Leviathan ring",
        back="Alaunus's Cape",
		waist="Luminary sash",
		legs="Inyanga Shalwar +1",
		feet="Uk'uxkaj boots"
	}

    sets.midcast.IntEnfeebles = {
		main="Yagrush", 
		sub="Ammurapi Shield", 
		ammo="Pemphredo tathlum",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Kishar ring",
		ring2="Shiva Ring +1",
        back="Alaunus's Cape",
		waist="Porous Rope",
		legs="Inyanga Shalwar +1",
		feet="Piety Duckbills +1"
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Numen Staff", 
		sub="Achaq Grip",
		ammo="Homiliary",
        head="Orvail Corona +1",
		neck="Eidolon pendant +1",
		ear1="Moonshade Earring",
		ear2="Relaxing Earring",
        body="Oracle's robe",
		hands="Nares Cuffs",
        back="Vita Cape",
		waist="Austerity Belt",
		legs="Menhit slacks",
		feet="Chelona Boots"
	}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	
    sets.idle = {
		main="Bolelabunga", 
		sub="Genmei Shield",
		ammo="Homiliary",
        head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Theophany briault +2",
		hands="Ayanmo manopolas +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Herald's Gaiters"
	}

    sets.idle.Refresh = {
		main="Terra's Staff", 
		sub="Oneiros Grip",
		ammo="Homiliary",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Vrikodara jupon",
		hands=gear.chironicGloves_Ref,
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet=gear.chironicSlippers_Ref
	}	
		
    sets.idle.PDT = {
	main="Terra's Staff",
    sub="Umbra Strap",
    ammo="Homiliary",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +2",
    feet="Aya. Gambieras +1",
    neck="Loricate Torque +1",
    waist="Fucho-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Genmei Earring",
    left_ring="Warden's Ring",
    right_ring="Defending Ring",
    back="Umbra Cape",
	}
    
	sets.idle.Craft = {
		head = "Magnifying Specs.",
		neck = "Weaver's Torque",
		body = "Weaver's Smock",
		hands = "Weaver's Cuffs",
		feet="Herald's Gaiters"
	}
	
	
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Ayanmo zucchetto +1",
		neck="Lissome Necklace",
		ear1="Brutal Earring",
		ear2="Odnowa earring +1",
        body="Ayanmo corazza +1",
		hands="Ayanmo Manopolas +1",
		ring1="Cacoethic ring +1",
		ring2="Petrov Ring",
        back=gear.AlaunusCape_Meele,
		waist="Windbuffet Belt +1",
		legs="Ayanmo cosciales +1",
		feet="Ayanmo gambieras +1"
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
