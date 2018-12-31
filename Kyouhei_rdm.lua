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
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	
	include('Kyouhei-Include.lua')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Merit', 'MeritNOMB', 'NOMB')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "Barfira" <me>')
	send_command('bind !F2 input /ma "Barwatera" <me>')
	send_command('bind !F3 input /ma "Baraera" <me>')
	send_command('bind !F4 input /ma "Barblizzara" <me>')
	send_command('bind !F5 input /ma "Barthundra" <me>')
	send_command('bind !F6 input /ma "Stun" <t>')
	send_command('bind !F7 input /ma "Raise III" <t>')
	send_command('bind !F8 input /ma "Arise" <t>')
	send_command('bind !F9 input /ma "Reraise III" <me>')
	send_command('bind !F10 input /ja "Penury" <me>; /echo --Save Mana--')
	send_command('bind !F11 gs c cycle CastingMode')
	send_command('bind !F12 gs c cycle OffenseMode')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Aquaveil" <me>')
	send_command('bind ^F4 input /ma "Dispel" <t>')
	send_command('bind ^F5 input /ma "Dia II" <t>')
	send_command('bind ^F6 input /ma "Slow" <t>')
	send_command('bind ^F7 input /ma "Paralyze" <t>')
	send_command('bind ^F8 input /ma "Addle" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input /ma "Banish III" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE--')
	
-- Debuffs ALT	
	send_command('bind !1 input /ma "Paralyna" <t>')
	send_command('bind !2 input /ma "Silena" <t>')
	send_command('bind !3 input /ma "Blindna" <t>')
	send_command('bind !4 input /ma "Cursna" <t>')
	send_command('bind !5 input /ma "Stona" <t>')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Esuna" <me>')
	send_command('bind !9 input /ja "Sacrifice" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != input /ja "Sacrosanctity" <me>; input /echo Sacro- Magic Defense')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Flash" <t>')
	send_command('bind ^2 input /ma "Curaga" <t>')
	send_command('bind ^3 input /ma "Cure III" <t>')
	send_command('bind ^4 input /ma "Cure IV" <t>')
	send_command('bind ^5 input /ma "Cure V" <t>')
	send_command('bind ^6 input /ma "Cure VI" <t>')
	send_command('bind ^7 input /ma "Haste II" <t>')
	send_command('bind ^8 input /ma "Flurry II" <t>')
	send_command('bind ^9 input /ma "Repose" <t>')
	send_command('bind ^0 input /ma "Refresh II" <t>')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')

    select_default_macro_book()
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
		head= gear.merlinicHood_FC,
		neck="Orunmila's Torque",
		ear1="Enchanter Earring +1",
		ear2="Loquacious Earring",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		waist="Ninurta's Sash",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		--back="Sucellos's Cape",
		legs="Psycloth lappas",
		feet=gear.merlinicCrackows_FC
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
	body="Heka's kalasiris", 
	ear1="Nourishing earring +1", 
	ear2="Mendicant's earring"
	})

    --sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		ear2="Mendicant's earring"
	})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Chainspell = {body="Vitiation tabard"}
    sets.precast.JA.Composure = {leg="Lethargy houseaux +1"}
	
    
    -- Weaponskill sets
	
	--Default MND
    sets.precast.WS = {
        head="Vanya hood",neck="Phalaina locket",ear1="Nourishing earring +1",ear2="Brutal Earring",
        body="Vanya robe",hands="Vanya cuffs",ring1="Aquasoul Ring",ring2="Spiral ring",
        back="Kaikias' cape",waist="Pythia Sash +1",legs="Vanya slops",feet="Wayfarer clog"}
	--MAB
    sets.precast.WS['Flash Nova'] = {
        head="Vanya hood",neck="Stoicheion medal",ear1="Novio Earring",ear2="Hecate earring",
        body="Vanya Robe",hands="Vanya cuffs",ring1="Prolix ring",ring2="Acumen ring",
        back="Hekate's cape",waist="Maniacus sash",legs="Wayfarer slops",feet="Vanya clogs"}
	--Gorget/Mnd	
	sets.precast.WS['Realmrazer'] = {
        head="Vanya hood",neck="Light Gorget",ear1="Nourishing earring +1",ear2="Brutal Earring",
        body="Vanya robe",hands="Vanya cuffs",ring1="Tamas ring",ring2="Aquasoul ring",
        back="Kaikias' cape",waist="Light Belt",legs="Vanya slops",feet="Vanya clogs"}
		
	sets.precast.WS['Myrkr'] = {
		ammo="Hydrocera",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Mendicant's Earring",
		ear2="Etiolation earring",
		body="Vanya Robe",
		hands="Kaykaus cuffs",
		ring1="Prolix Ring",
		ring2="Lebeche Ring",
		back="Oretania's cape +1",
		waist="Luminary Sash",
		legs="Psycloth Lappas",
		feet="Kaykaus boots"
	}
		

    -- Midcast Sets
    
	
    -- Cure sets
	sets.midcast.Cure = {
		main={name="Ames",priority=16},
		sub={name="Genmei Shield", priority=15},
		ammo="Hydrocera",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
		body="Kaykaus Bliaut",
		hands="Kaykaus cuffs",
		ring1="Lebeche Ring",
		ring2="Sirona's Ring",
        back="Solemnity Cape", 
		waist=gear.ElementalObi, 
		legs="Vanya Slops",
		feet="Kaykaus Boots"
	}

    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.conserve = {
		main={name="Grioavolr",priority=16},
		sub={name="Giuoco grip",priority=15},
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
		body="Chironic doublet",
        back="Solemnity cape",
		waist="Austerity Belt +1",
		legs="Vanya slops",
		feet="Kaykaus Boots"
	}
	
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve

	sets.midcast.Cursna = {
        head="Vanya Hood",
		neck="Malison Medallion",
		ring1="Haoma's Ring",
		ring2="Haoma's Ring",
		back="Oretan. Cape +1",
		feet="Vanya clogs"
	}	

   -- Enhancing Magic Skill
 sets.midcast['Enhancing Magic'] = {
		sub={name="Ammurapi Shield",priority=15},
        head="Telchine Cap",
		neck="Incanter's Torque",
		ear2="Andoaa Earring",
        body=gear.telchineChasuble_Enhancing,
		hands="Atrophy Gloves +2",
		back="Sucellos's Cape",
		waist="Olympus Sash",
		legs=gear.telchineBraconi_Enhancing,
		feet="Lethargy houseaux +1"	
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
		hands="Atrophy Gloves +2",
		legs=gear.telchineBraconi_Enhancing,
		feet="Lethargy houseaux +1"
	})
	

	sets.midcast.Refresh = sets.midcast.Haste
	sets.midcast.Regen = sets.midcast.Haste
	sets.midcast.Phalanx = sets.midcast.Haste
	sets.midcast.Flurry = sets.midcast.Haste
	
    sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'],{
        head="Telchine Cap",
		neck="Incanter's Torque",
        body=gear.telchineChasuble_Enhancing,
		hands="Atrophy Gloves +2",
		waist="Olympus Sash",
		legs=gear.telchineBraconi_Enhancing,
		feet="Lethargy houseaux +1"
	})

    sets.midcast.Protect = {
		ring1="Sheltered Ring",
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Atrophy Gloves +2",
		legs=gear.telchineBraconi_Enhancing,
		feet="Lethargy houseaux +1"
	}

    sets.midcast.Shell = sets.midcast.Protect 
	sets.midcast.Shellra = sets.midcast.Protect 
	sets.midcast.Protectra = sets.midcast.Protect 
	
	sets.midcast['Divine Magic'] = {
		ammo="Hydrocera",
        head="Inyanga tiara +2",
		neck="Eddy Necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga Jubbah +2",
		hands="Inyanga Dastanas +2",
		ring1="Perception ring",
		ring2="Aquasoul Ring",
        back="Sucellos's Cape",
		waist=gear.ElementalObi,
		legs="Inyanga Shalwar +2",
		feet="Inyanga crackows +2"
	}
	
	
	 sets.midcast['Elemental Magic'] = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric gages",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
        back="Sucellos's Cape",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
 
	sets.midcast['Elemental Magic'].NOMB = {
		main={name="Grioavolr", priority=16},
		sub={name="Alber Strap", priority=15},
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Sanctity Necklace",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring1="Strendu ring",
		ring2="Shiva Ring +1",
        back="Sucellos's Cape",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}	
	
	sets.midcast['Elemental Magic'].Merit = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Friomisi Earring",
        body="Seidr Cotehardie",
		hands="Amalric gages",
		ring1="Mujin Band",
		ring2="Shiva Ring +1",
        back="Sucellos's Cape",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}

	sets.midcast['Elemental Magic'].Helix = set_combine(sets.midcast['Elemental Magic'], {
	waist="Refoccilation Stone"
	})
	
	sets.midcast.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head="",body="Twilight Cloak"})
		
    sets.midcast['Dark Magic'] = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Erra Pendant",
		ear1="Enchanter Earring +1",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands=gear.chironicGloves_Magic,
		ring1="Vertigo Ring",
		ring2="Evanescence ring",
        back="Sucellos's Cape",
		waist="Luminary Sash",
		legs="Jhakri slops +2",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
		head=gear.merlinicHood_Magic,
		neck="Erra Pendant", 
		ear1="Hirudinea earring", 
		ear2="Barkaro. Earring",
		ring2="Evanscence ring",
		waist="Fucho-no-Obi",
		feet=gear.merlinicCrackows_Magic
	})
	
	sets.midcast.Aspir = sets.midcast.Drain
	
    -- Custom spell classes
	
    sets.midcast.MndEnfeebles = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Regal Gem",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Dignitary's Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring1="Vertigo Ring",
		ring2="Kishar Ring",
        back="Sucellos's Cape",
		waist="Luminary sash",
		legs="Jhakri slops +2",
		feet="Jhakri pigaches +2"
	}
	sets.midcast.Frazzle = sets.midcast.MndEnfeebles
	sets.midcast['Frazzle II'] = sets.midcast.MndEnfeebles
	sets.midcast['Frazzle III'] = sets.midcast.MndEnfeebles
	sets.midcast.Distract = sets.midcast.MndEnfeebles
	sets.midcast['Distract II'] = sets.midcast.MndEnfeebles
	sets.midcast['Distract III'] = sets.midcast.MndEnfeebles
	
    sets.midcast.IntEnfeebles = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Regal Gem",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Regal Earring",
		ear2="Enchanter Earring +1",
		body=gear.merlinicJubbah_Magic,
		hands="Jhakri Cuffs +2",
		ring2="Kishar ring",
		ring2="Shiva Ring +1",
        back="Sucellos's Cape",
		waist="Luminary sash",
		legs="Jhakri slops +2",
		feet="Jhakri pigaches +2"
	}

	sets.midcast.Sleep = set_combine(sets.midcast.IntEnfeebles, {
		ring2="Archon Ring"
	})
    
	sets.midcast['Dia III'] = set_combine(sets.midcast.MndEnfeebles, {head="Vitiation Chapeau +1"})

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		main={name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		ammo="Homiliary",
        head="Vitiation Chapeau +1",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation earring",
        body="Jhakri Robe +2",
		hands=gear.chironicGloves_Ref,
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Carmine Cuisses +1",
		feet=gear.chironicSlippers_Ref
	}

    sets.idle.Refresh = {
		main={name="Grioavolr", priority=16},
		sub={name="Enki Strap", priority=15},
		ammo="Homiliary",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation earring",
        body="Jhakri Robe +2",
		hands=gear.chironicGloves_Ref,
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Fucho-no-Obi",
		legs="Carmine Cuisses +1",
		feet="Mallquis clogs +2"
	}
		
    sets.idle.PDT = {
		main={name="Terra's Staff", priority=16},
		sub={name="Oneiros Grip", priority=15},
		ammo="Staunch Tathlum",
        head=gear.chironicHat_Ref,
		neck="Loricate Torque +1",
		ear1="Odnowa earring +1",
		ear2="Etiolation earring",
        body="Vrikopdara jupon",
		hands=gear.chironicGloves_Ref,
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Carmine Cuisses +1",
		feet="Mallquis clogs +2"
	}
    

    sets.latent_refresh = {waist="Fucho-no-obi"}

    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Ayanmo Zucchetto +2",
		neck="Lissome necklace",
		ear1="Brutal Earring",
		ear2="Zennaroi earring",
        body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring1="Petrov Ring",
		ring2="Cacoethic ring +1",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Jhakri's slops +2",
		feet="Jhakri's pigaches +2"
	}


end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
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

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
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

-- Custom spell mapping.


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
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
