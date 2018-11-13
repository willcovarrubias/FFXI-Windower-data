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
	include('Alaza-Include.lua')
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	
	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

	send_command('alias mis input /item "Mana Mist" <me>; ')
	send_command('alias pow input /item "Mana powder" <me>; ')
	send_command('alias wing1 input /item "lucid wings I" <me>; ')
	send_command('alias wing2 input /item "lucid wings II" <me>; ')
	send_command('alias wing input /item "Daedalus wing" <me>; ')
	
	send_command('alias ech input /item "Echo Drops" <me>; ')
	send_command('alias holy input /item "Holy Water" <me>; ')
	send_command('alias rem input /item "Remedy" <me>; ')
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
	send_command('bind ^F6 input /ma "geo-languor" <bt>')
	send_command('bind ^F7 input /ma "indi-focus" <me>')
	send_command('bind ^F8 input /ma "geo-malaise" <bt>')
	send_command('bind ^F9 input /ma "indi-refresh" <t>')
	send_command('bind ^F10 input /ma "indi-torpor" <me>')
	send_command('bind ^F11 input /ma "geo-frailty" <bt>')
	send_command('bind ^F12 input /ma "indi-fury" <me>')

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
	send_command('bind ^5 input /ma "Paralyna" <t>')
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
		main="Grioavolr", 
		sub="umbra strap",
		ammo="Impatiens",
        head="Vanya Hood",
		ear1="Enchanter earring +1",
		ear2="Loquacious Earring",
        body="Anhur robe",
		hands="Geomancy Mitaines +1",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
        back="Lifestream Cape",
		waist="Channeler's stone",
		legs="Orvail Pants +1",
		feet="Chelona Boots +1"
	}
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {neck="Stone Gorget", waist="Siegel Sash"})

	
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
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Curative = {hands="Bagua Mitaines +1"}
    sets.precast.JA.Life = {body="Geomancy Tunic +1", back="Nantosuelta's Cape"}
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA.Mending = {legs="Bagua Pants +1"}
    sets.precast.JA.Primeval = {head="Bagua Galero +1"}
	sets.precast.JA.Full = {head="Azimuth Hood +1"}
	
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
	
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
	
	--WS, MAB Based
    sets.precast.WS['Flash Nova'] = {
        head="Merlinic Hood",
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
		
		

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        main="Solstice",
		sub="Genmei Shield",
		range="Dunna",
        head="Vanya Hood",
		ear2="Loquacious Earring",
        body="Anhur Robe",
		hands="Gendewitha Gages +1",
		ring1="Prolix Ring",
        back="Lifestream Cape",
		waist="Channeler's Stone",
		legs="Orvail Pants +1",
		feet="Chelona Boots +1"
	}
    
    -- Cure sets
    gear.default.obi_waist = "Pythia sash +1"
    gear.default.obi_back = "Lifestream Cape"

    sets.midcast.Cure = {
		main="Tamaxchi",
		sub="Genmei Shield",
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

    sets.midcast.Curaga = {
		main="Tamaxchi",
		sub="Genmei Shield",
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
	
	sets.midcast.conserve = {
		main="Solstice",
		sub="Genmei Shield",
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's Earring",
        body="Hedera Cotehardie",
        back="Vita Cape",
		waist="Pythia sash +1",
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
		feet="Vanya clogs"
	}

    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
        head="Umuthi Hat",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		hands="Augur's Gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Potent Pants",
		feet="Rubeus Boots"
	}
		
    sets.midcast.Stoneskin = {
		neck="Nodens gorget",
		waist="Siegel Sash",
		legs="Haven Hose"
	}

    sets.midcast.BarElement = {
        head="Orison Cap +2",
		neck="Colossus's Torque",
        body="Orison Bliaud +2",
		hands="Orison Mitts +2",
        back="Mending cape",
		waist="Olympus Sash",
		legs="Piety Pantaloons",
		feet="Orison Duckbills +2"
	}

    sets.midcast.Regen = {
        head="Inyanga tiara +1", 
		body="Piety Briault",
		hands="Orison Mitts +2",
        legs="Piety Pantaloons"
	}

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast['Divine Magic'] = {
        head="Inyanga Tiara +1",
		neck="Eddy Necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga Jubbah +1",
		hands="Vanya Cuffs",
		ring1="Perception ring",
		ring2="Aquasoul Ring",
        back="Nantosuelta's Cape",
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
        head="Merlinic Hood",
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Jhakri Robe +1",
		hands="Amalric gages",
		ring1="Strendu Ring",
		ring2="Mujin Band",
        back="Nantosuelta's cape",
		waist="Refoccilation stone",
		legs="Merlinic Shalwar",
		feet="Merlinic Crackows"
	}	
	
	
	sets.midcast.sleep = {
		main="Solstice", 
		sub="Culminus",
        head="Merlinic Hood",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
		waist="Casso Sash",
		legs="Vanya Slops",
		feet="Jhakri Pigaches +1"
	}	
		
	sets.midcast.Geomancy = {
		main="Solstice",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Incanter's Torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's earring",
		body="Bagua Tunic +1",
		hands="Geomancy Mitaines +1",
		ring1="Vocane Ring",
		ring2="Dark Ring",
		back="Lifestream Cape",
		waist="Pythia Sash +1",
		legs="Bagua Pants +1",
		feet="Azimuth Gaiters +1"
	}	

	sets.midcast.Geomancy.Indi = {
		main="Solstice",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Incanter's Torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's earring",
		body="Bagua Tunic +1",
		hands="Geomancy Mitaines +1",
		ring1="Vocane Ring",
		ring2="Dark Ring",
		back="Lifestream Cape",
		waist="Pythia Sash +1",
		legs="Bagua Pants +1",
		feet="Azimuth Gaiters +1"
	}
	
		
    sets.midcast['Dark Magic'] = {
		main="Solstice", 
		sub="Culminus",
        head="Merlinic Hood",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
		waist="Casso Sash",
		legs="Vanya Slops",
		feet="Jhakri Pigaches +1"
	}

	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		main="appetence crown",
		neck="Incanter's torque", 
		ring1="Excelsis Ring",
		ring2="Evanscence ring"
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		main="appetence crown",
		neck="Incanter's torque", 
		ring1="Excelsis Ring",
		ring2="Evanscence ring"
	})
	
	
    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Solstice", 
		sub="Culminus",
        head="Merlinic Hood",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Leviathan Ring",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
		waist="Casso Sash",
		legs="Vanya Slops",
		feet="Jhakri Pigaches +1"
	}

    sets.midcast.IntEnfeebles = {
		main="Solstice", 
		sub="Culminus",
        head="Merlinic Hood",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Diamond Ring",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
		waist="Casso Sash",
		legs="Vanya Slops",
		feet="Jhakri Pigaches +1"
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Numen Staff", 
		sub="Achaq Grip",
        head="Orvail Corona +1",
		neck="Jeweled collar",
		ear1="Moonshade Earring",
		ear2="Relaxing Earring",
        body="Oracle's robe",
		hands="Nares Cuffs",
		ring1="Prolix Ring",
		ring2="Tamas Ring",
        back="Vita Cape",
		waist="Cleric's belt",
		legs="Menhit slacks",
		feet="Chelona Boots +1"
	}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		main="Solstice", 
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa earring +1",
        body="Jhakri Robe +1",
		hands="Geomancy Mitaines +1",
		ring1="Defending ring",
		ring2="warden's Ring",
        back="Lifestream Cape",
		waist="Isa belt",
		legs="Assiduity pants +1",
		feet="Bagua Sandals +1"	
	}

    sets.idle.Refresh = {
		main="Solstice", 
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa earring +1",
        body="Jhakri Robe +1",
		hands="Geomancy Mitaines +1",
		ring1="Vocane Ring",
		ring2="Dark Ring",
        back="Lifestream Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Azimuth Gaiters +1"		
	}	
		
    sets.idle.PDT = {
		main="Terra's Staff", 
		sub="Umbra Strap",
		range="Dunna",
		head="Azimuth Hood +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa earring +1",
        body="Vanya Robe",
		hands="Geomancy Mitaines +1",
		ring1="Vocane Ring",
		ring2="Dark Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Gyve Trousers",
		feet="Azimuth Gaiters +1"		
	}
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
        body="Wayfarer Robe",
		hands="Vanya Cuffs",
		ring1="Mars's Ring",
		ring2="Spiral ring",
        back="Cheviot Cape",
		waist="Ninurta's Sash",
		legs="Vanya slops",
		feet="Vanya clogs"
	}
	
	--sets.idle.Town = {
	--head = "Magnifying Specs.",
	--neck = "Weaver's Torque",
	--body = "Weaver's Smock",
	--hands = "Weaver's Cuffs",
	--feet="Herald's Gaiters"
	--}
	
	--sets.latent_refresh = {waist="Fucho-no-Obi"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
		sets.buff['Divine Caress'] = {
		hands="Orison Mitts +2",
		back="Mending Cape"
	}
	
--Sample For Dark Ring
--DarkRing.physical = {name="Dark Ring",augments={"[1]Accuracy+9","[2]STR+4"}}
--DarkRing.physical2 = {name="Dark Ring",augments={"[1]Attack+12","[2]\"Mag.Atk.Bns\"+12","[3]STR+11"}}
	
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
--    set_macro_page(4, 14)
end
