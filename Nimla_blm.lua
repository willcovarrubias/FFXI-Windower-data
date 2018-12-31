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
	send_command('alias MMPP input /ws "Myrkr"; input /echo  Myrkr ;')
	send_command('alias echos input /item "Echo Drops" <me>; input /echo  ECHO DROPS;')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'MB', 'NormalMerit', 'MBMerit')
    state.IdleMode:options('Idle', 'Refresh')
	
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
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Klimaform" <me>')
	send_command('bind ^F4 input /ma "Aquaveil" <me>')
	send_command('bind ^F5 input /ma "Klimaform" <me>')
	send_command('bind ^F6 input /ma "Dispel" <t>')
	send_command('bind ^F7 input /ma "Frazzle" <t>')
	send_command('bind ^F8 input /ma "Distract" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input ')
	send_command('bind ^F11 input ')
	send_command('bind ^F12 input /ja "Manawell" <me>')


-- Debuffs ALT	
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
	send_command('bind !- input /ja "Mana wall" <me>')
	send_command('bind != input /ja "Sublimation" <me>')


-- Misc CTRL	
	send_command('bind ^1 input /item "Oracle\'s Drink" <me>')
	send_command('bind ^2 input /item "Braver\'s Drink" <me>')
	send_command('bind ^3 input /item "Assassin\'s Drink" <me>')
	send_command('bind ^4 input /item "Soldier\'s Drink" <me>')
	send_command('bind ^5 input /item "Lucid Elixir" <me>')
	send_command('bind ^6 input /item "Lucid Elixir II" <me>')
	send_command('bind ^7 input /ma "Haste" <t>')
	send_command('bind ^8 input //exec sch/fragmentation.txt')
	send_command('bind ^9 input //exec sch/gravitation.txt')
	send_command('bind ^0 input //exec sch/distortion.txt')
	send_command('bind ^- input //exec sch/fusion.txt')
	send_command('bind ^= input /ja "Alacrity" <me>')

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
		neck="Baetyl pendant",
		ear1="Loquacious Earring",
		ear2="Etiolation earring",
		back=gear.TaranusCape_FC,
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		waist="Channeler's stone",
		legs=gear.merlinicShalwar_FC,
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
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Immanence = {hands="Arbatel bracers "}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
	
	-- Myrkr WS, buff with MP+ ---

	sets.precast.WS['Myrkr'] = {
		head="Pixie hairpin +1",neck="Sanctity necklace",ear1="Loquacious earring",ear2="Etiolation earring",
        body="Amalric doublet",hands="Telchine gloves",ring1="Prolix ring",ring2="Dark ring",
        back=gear.TaranusCape_FC,waist="Fucho-no-obi",legs=gear.merlinicShalwar_MBB,feet="Telchine pigaches"
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
	
	
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve


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


    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
        head="Befouled crown",
		neck="Incanter's Torque",
        body="Anhur Robe",
		hands="Chironic gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Shedir Seraweels"
	}
		
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'],{
		neck="Stone Gorget",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})


	sets.midcast['Elemental Magic'] = {ammo="Pemphredo tathlum",
        head="Jhakri coronal +1",neck="Sanctity necklace",ear1="Friomisi earring",ear2="Barkarole earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +1",ring1="Shiva ring",ring2="Shiva ring", --Add Shiva+1
        back=gear.TaranusCape_MAB,waist=gear.ElementalObi,legs="Jhakri slops +1",feet="Jhakri pigaches +1"}
 
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, neck="Mizukage-no-Kubikazari",body=gear.merlinicJubbah_MBB,hands="Amalric gages", 
	legs=gear.merlinicShalwar_MBB, ring1="Mujin band", feet=gear.merlinicCrackows_MBB})	
	
	sets.midcast['Elemental Magic'].NormalMerit = set_combine(sets.midcast['Elemental Magic'], {body="Spaekona's coat +1"})

	sets.midcast['Elemental Magic'].MBMerit = set_combine(sets.midcast['Elemental Magic'], {head=gear.merlinicHood_MBB, body="Spaekona's coat +1", neck="Mizukage-no-Kubikazari",
	hands="Amalric gages", ring1="Mujin band", legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB})

	
	
	
	
	sets.midcast.Death = {
		ammo="Pemphredo tathlum",
        head="Pixie hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Friomisi earring",ear2="Barkarole earring",
        body=gear.merlinicJubbah_MBB,hands="Amalric gages",ring1="Mujin band",ring2="Archon ring", 
        back=gear.TaranusCape_MAB,waist=gear.ElementalObi,legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB
	}
	
	
	sets.midcast.Death.MB = {
		set_combine(sets.midcast['Elemental Magic'].MB, {head="Pixie Hairpin +1",ring2="Archon Ring"})
	}
	
	sets.midcast.Comet = {
		ammo="Pemphredo tathlum",head="Pixie Hairpin +1",neck="Mizukage-no-Kubikazari",ear1="Friomisi Earring",		ear2="Barkaro. Earring",
        body="Jhakri robe +2",hands="Amalric Gages",ring1="Mujin Band",ring2="Shiva ring",
		back=gear.TaranusCape_MAB,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast.Comet.MB = set_combine(sets.midcast['Elemental Magic'].MB, {head="Pixie Hairpin +1", ring2="Archon Ring"})
	
	sets.midcast.Impact = {
		ammo="Pemphredo tathlum",head="",neck="Mizukage-no-Kubikazari",ear1="Friomisi Earring",ear2="Barkaro. Earring",
        body="Twilight Cloak",hands="Amalric Gages",ring1="Mujin Band",ring2="Shiva ring",
		back=gear.TaranusCape_MAB,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinicCrackows_Magic
	}

	sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight cloak", head=empty,ring2="Archon Ring"})

	sets.midcast.sleep = {
		ammo="Pemphredo tathlum",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +2",
		hands="Jhakri Cuffs +1",
		ring1="Vertigo Ring",
		ring2="Archon Ring",
        back=gear.TaranusCape_MAB,
		waist="Casso Sash",
		legs="Jhakri Slops +1",
		feet="Uk'uxkaj boots"
	}	
		
    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo tathlum",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +2",
		hands="Jhakri Cuffs +1",
		ring1="Vertigo Ring",
		ring2="Archon Ring",
        back=gear.TaranusCape_MAB,
		waist="Casso Sash",
		legs="Jhakri Slops +1",
		feet="Uk'uxkaj boots"
	}
	
	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		head="Merlinic hood",
		ring2="Evanscence ring",
		legs="Jhakri Slops +1",
		feet="Merlinic crackows"
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		head="Merlinic hood",
		ring2="Evanscence ring",
		legs="Jhakri Slops +1",
		feet="Merlinic crackows"
	})
	
	

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		ammo="Hydrocera",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +2",
		hands="Jhakri cuffs +1",
		ring1="Leviathan Ring",
		ring2="Vertigo Ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet="Jhakri pigaches +1"
	}

    sets.midcast.IntEnfeebles = {
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +2",
		hands="Jhakri cuffs +1",
		ring1="Shiva Ring +1",
		ring2="Vertigo Ring",
        back=gear.TaranusCape_MAB,
		waist="Luminary sash",
		legs="Jhakri Slops +1",
		feet="Jhakri pigaches +1"
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
        head="Befouled crown",
		neck="Loricate Torque +1",
		ear1="Genmei Earring",
		ear2="Etiolation earring",
        body="Jhakri robe +2",
		hands="Jhakri Cuffs +1",
		ring1="Defending Ring",
		ring2="Dark Ring",
        back="Solemnity Cape",
		waist="Channeler's Stone",
		legs="Lengo pants",
		feet="Herald's gaiters"
	}

    sets.idle.Refresh = {
        head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa Earring +1",
        body="Jhakri robe +2",
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
		gear.default.obi_waist = "Refoccilation stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Refoccilation stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
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
