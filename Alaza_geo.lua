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
	send_command('bind !8 input /ma "" <me>')
	send_command('bind !9 input /ma "" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input /ja "Full Circle" <me>')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Cure" <t>')
	send_command('bind ^2 input /ma "Cure II" <t>')
	send_command('bind ^3 input /ma "Cure III" <t>')
	send_command('bind ^4 input /ma "Cure IV" <t>')
	send_command('bind ^5 input /ma "" <t>')
	send_command('bind ^6 input /ma "Flurry" <t>')
	send_command('bind ^7 input /ma "Haste" <t>')
	send_command('bind ^8 input /ma "Regen V" <t>')
	send_command('bind ^9 input /ma "Thundara II" <t>')
	send_command('bind ^0 input /ma "Blizzara II" <t>')
	send_command('bind ^- input /ma "Fira II" <t>')
	send_command('bind ^= input /ma "Watera II" <t>')

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
		sub="Genmei Shield",
        head= gear.merlinicHood_FC,
		neck="Voltsurge Torque",
		ear2="Loquacious Earring",
        body="Anhur robe",
		hands=gear.merlinicDastanas_FC,
		ring1="Prolix Ring",
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
	
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Curative = {hands="Bagua Mitaines"}
    sets.precast.JA.Life = {body="Geomancy Tunic", back="Nantosuelta's Cape"}
	sets.precast.JA.Bolster = {body="Bagua tunic"}
	sets.precast.JA.Mending = {legs="Bagua Pants"}
    sets.precast.JA.Primeval = {head="Bagua Galero"}
	sets.precast.JA.Full = {head="Azimuth Hood"}
	
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

	--sets.midcast.Cure = {
		--main="Tamaxchi",
		--sub="Culminus",
        --head="Bagua galero",
		--neck="Sanctity necklace",
		--ear1="Odnowa Earring",
		--ear2="Odnowa Earring +1",
        --body="Bagua tunic", 
		--ring1="Haoma's Ring",
		--ring2="Eihwaz Ring",
        --back="Lifesteam Cape",
		--waist="Porous Rope",
		--legs="Bagua pants",
		---feet="Azimuth gaiters"
	--}
	
	
	
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
		waist=gear.ElementalObi,
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
		waist=gear.ElementalObi,
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
        body="Jhakri robe +1",
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
		back="Oretan. Cape +1",
		feet="Vanya clogs"
	}

    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
        head="Befouled crown",
		neck="Incanter's Torque",
		ear1="Andoaa Earring",
		hands="Augur's Gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Potent Pants",
		feet="Rubeus Boots"
	}
		
    sets.midcast.Stoneskin = {
		neck="Stone Gorget",
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
        head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Jhakri Robe +1",
		hands="Amalric Gages",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
        back="Nantosuelta's cape",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}

	sets.midcast['Elemental Magic'].Resistant = {
        main="Solstice", 
		sub="Culminus",
        head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Strendu Ring",
		ring2="Mujin Band",
        back="Nantosuelta's cape",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet="Jhakri pigaches +1"
	}	
	
	
	sets.midcast.sleep = {
		main="Solstice", 
		sub="Culminus",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
		waist="Casso Sash",
		legs="Jhakri slops +1",
		feet=gear.merlinicCrackows_Macc
	}	
		
	sets.midcast.Geomancy = {
		main="Solstice",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood",
		neck="Incanter's Torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's earring",
		body="Bagua tunic",
		hands="Geomancy Mitaines +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
		back="Lifestream Cape",
		waist="Pythia Sash +1",
		legs="Bagua Pants",
		feet="Azimuth Gaiters"
	}	

	sets.midcast.Geomancy.Indi = {
		main="Solstice",
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood",
		neck="Incanter's Torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's earring",
		body="Bagua tunic",
		hands="Geomancy Mitaines +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
		back="Lifestream Cape",
		waist="Pythia Sash +1",
		legs="Bagua Pants",
		feet="Azimuth Gaiters"
	}
	
		
    sets.midcast['Dark Magic'] = {
		main="Solstice", 
		sub="Culminus",
        head=gear.merlinicHood_Magic,
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
		feet=gear.merlinicCrackows_Macc
	}

	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		main="appetence crown",
		neck="Incanter's torque", 
		ring1="Excelsis Ring",
		ring2="Evanscence ring",
		waist="Fucho-no-obi"
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		main="appetence crown",
		neck="Incanter's torque", 
		ring1="Excelsis Ring",
		ring2="Evanscence ring",
		waist="Fucho-no-obi"
	})
	
	
    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Solstice", 
		sub="Culminus",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Leviathan Ring",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet="Jhakri pigaches +1"
	}

    sets.midcast.IntEnfeebles = {
		main="Solstice", 
		sub="Culminus",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri Robe +1",
		hands="Jhakri cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Vertigo Ring",
        back="Nantosuelta's cape",
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
		main="Solstice", 
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood",
		neck="Twilight Torque",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
        body="Jhakri Robe +1",
		hands="Geomancy Mitaines",
		ring1="Fortified Ring",
		ring2="Defending Ring",
        back="Lifestream Cape",
		waist="Isa Belt",
		legs="Assiduity pants +1",
		feet="Azimuth Gaiters"	
	}

    sets.idle.Refresh = {
		main="Solstice", 
		sub="Genmei Shield",
		range="Dunna",
		head="Azimuth Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
        body="Jhakri Robe +1",
		hands="Geomancy Mitaines",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Lifestream Cape",
		waist="Isa Belt",
		legs="Assiduity pants +1",
		feet="Azimuth Gaiters"	
	}	
		
    sets.idle.PDT = {
		main="Terra's Staff", 
		sub="Umbra Strap",
		range="Dunna",
		head="Azimuth Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Handler's earring +1",
        body="Vrikodara jupon",
		hands="Geomancy Mitaines",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Gyve Trousers",
		feet="Azimuth Gaiters"	
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
	
	--sets.latent_refresh = {waist="Fucho-no-Obi"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
		sets.buff['Divine Caress'] = {
		hands="Orison Mitts +2",
		back="Mending Cape"
	}

	
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
