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
	
	send_command('alias craftgear input //gs equip sets.crafting')
	
	state.Buff.Barrage = buffactive.Barrage or false
--state.Buff.Camouflage = buffactive.Camouflage or false
end

	
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Ranged','Melee', 'DW', 'Kraken')
	state.RangedMode:options('Normal', 'Acc')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'PDT', 'MDT')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	state.WeaponskillMode:options('Normal','Acc')

    	-- Debuffs ALT	
	send_command('bind !1 input /ra <t>')
	send_command('bind !2 input /ws "Last Stand" <t>')
	send_command('bind !3 input /ws "True Flight" <t>')
	send_command('bind !4 input /ja "Maintenance" <me>; input /echo --MAINTENANCE--')
	send_command('bind !4 input /ja "Dawn Mulsum" <me>; input /echo --MULSUM--')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Esuna" <me>')
	send_command('bind !9 input /ma "Sacrifice" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- gs c cycle OffenseMode')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ja "Fire Maneuver" <me>; /echo --Fire--')
	send_command('bind ^2 input /ja "Wind Maneuver" <me>; /echo --Wind--')
	send_command('bind ^3 input /ja "Light Maneuver" <me>; /echo --Light--')
	send_command('bind ^4 input /ja "Earth Maneuver" <me>; /echo --Earth--')
	send_command('bind ^5 input /ja "Water Maneuver" <me>; /echo --Water--')
	send_command('bind ^6 input /ja "Dark Maneuver" <me>; /echo --Dark--')
	send_command('bind ^7 input /ja "Thunder Maneuver" <me>; /echo --Thunder--')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input /ma "Repose" <t>')
	send_command('bind ^0 input /ma "Refresh" <t>')
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
	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
	--AF3 reforged head //maybe  
	--Adhemar kecks
		head="Amini Gapette", --6
		body="Amini caban", --10
		hands="Carmine Finger Gauntlets", --7
		--back=gear.belenusCape_Snap,
		waist="Impulse Belt", --3
		legs="Adhemar kecks", --9
		feet="Meghanada jambeaux +2" --8
	}
		
		--[[head="Amini gapette",
		body="Amini caban +1",hands="Carmine finger gauntlets +1", 
		back=gear.belenusCape_Snap,waist="Impulse Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}]]--
	
	sets.precast.JA['Velocity Shot'] = {body="Amini caban"}
	
	sets.precast.JA['Bounty Shot'] = {hands="Amini glovelettes +1"}

	sets.precast.JA['Eagle Eye Shot'] = {
		head="Meghanada visor +2",
		neck="Iskur gorget",
		ear1="Telos earring",
		ear2="Enervating earring",
		body="Meghanada cuirie +2",
		hands="Carmine finger gauntlets +1",
		ring1="Ilabrat ring",
		ring2="Dingir ring",
		back=gear.BelenussCape_TP,
		waist="Yemaya belt",
		legs="Adhemar kecks",
		feet="Meghanada jambeaux +2"
	}

	sets.precast.JA['Barrage'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
    

    sets.precast.WS['Coronach'] = {	
		head="Meghanada visor +2",
		neck="Fotia gorget",
		ear1="Ishvara earring",
		ear2="Sherida earring",
        body="Meghanada cuirie +2",
		hands="Meghanada gloves +2",
		ring1="Ilabrat ring",
		ring2="Dingir Ring",
        back=gear.BelenussCape_WSD,
		waist="Fotia Belt",
		legs="Meghanada chausses +2",
		feet=gear.herculeanBoots_RAWSD
		} 	
																										

	sets.precast.WS['Last Stand'] = {
		head="Orion Beret +3",
		neck="Fotia gorget",
		ear1="Telos Earring",
		ear2="Ishvara earring",
        body="Meghanada cuirie +2",
		hands="Meghanada gloves +2",
		ring1="Regal Ring",
		ring2="Dingir Ring",
        back=gear.BelenussCape_WSD,
		waist="Fotia Belt",
		legs=gear.herculeanTrousers_RAWSD,
		feet=gear.herculeanBoots_RAWSD
	}
		
	sets.precast.WS['Trueflight'] = {
		head="Orion Beret +3",
		neck="Sanctity Necklace",
		ear1="Friomisi earring",
		ear2="Novio Earring",
        body="Samnuha coat",
		hands="Carmine finger gauntlets",
		ring1="Regal Ring",
		ring2="Dingir Ring",
        back=gear.BelenussCape_WSD, 
		waist="Eschan stone",
		legs="Gyve Trousers",
		feet=gear.herculeanBoots_RAWSD
	}
		
		
	----Weaponskill Sets with Acc----

	sets.precast.WS['Coronach'].Acc =  set_combine(sets.precast.WS['Coronach'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})																							

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})


	--Midcast Sets STP RACC RATT--
	sets.midcast.RA = {
		head="Orion Beret +3",
		neck="Iskur gorget",
		ear1="Telos Earring",
		ear2="Enervating Earring",
		body="Orion jerkin +2", --orion
		hands="Carmine finger gauntlets",
		ring1="Regal Ring",
		ring2="Ilabrat ring",
		back=gear.BelenussCape_TP,
		waist="Yemaya Belt",
		legs="Adhemar kecks",
		feet="Meghanada jambeaux +2"
	}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Meghanada visor +2",neck="Combatant's torque",ring1="Hajduk ring +1", ring2="Hajduk ring",
		hands="Meghanada gloves +2",back=gear.belenusCape_STP})


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +3"})




    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --sets.resting = {main=gear.Staff.HMP, 
      --  body="Gendewitha Bliaut",hands="Serpentes Cuffs",
        --waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		head="Meghanada visor +2",
		neck="Loricate torque +1",
		ear1="Etiolation Earring",
		ear2="Odnowa earring +1",
		body="Meghanada cuirie +2",
		hands="Meghanada Gloves +2",
		ring1="Dark Ring",
		ring2="Defending ring",
		back="Solemnity cape",
		waist="Flume belt",
		legs="Carmine Cuisses +1",
		feet="Meghanada Jambeaux +2"
	}

    sets.idle.PDT = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Cassie earring",ear2="Upsurge Earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Vocane Ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Jute boots +1"}

	sets.idle.MDT = {ammo="Demonry Stone",
        head="Laeradr helm",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Upsurge earring",
        body="Laeradr breastplate",hands="Eschite Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Strendu mantle",waist="Nierenschutz",legs="Kaiser diechlings",feet="Hermes' sandals"}

	    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Loricate torque +1",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Loricate torque +1",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {feet="Jute boots +1"}

   -- sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
	
	--MAKE THIS BUILD INTO PDT BECAUSE OF MIDCAST.RA
	sets.engaged.Ranged = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Meghanada chausses +2",feet="Jute boots +1"}

    sets.engaged.Melee = {head=gear.herculeanHelm_TA,neck="Asperity necklace",ear1="Sherida earring",ear2="Telos earring",	
        body="Adhemar Jacket +1",hands="Adhemar wristbands +1",ring1="Petrov ring",ring2="Epona's ring",
        back="Lupine cape",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}
		
	sets.engaged.DW = set_combine(sets.engaged.Melee, {body="Adhemar Jacket +1",ear1="Suppanomimi"})

	sets.engaged.Kraken = {head="Carmine Mask",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Meghanada cuirie +2",hands="Carmine finger gauntlets",ring1="Apate Ring",ring2="Ilabrat ring",
        back="Lupine cape",waist="Goading belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}




    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.

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

-- Called by the 'update' self-command.


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end


function job_midcast(spell, action, spellMap, eventArgs)
if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
equip(sets.buff.Barrage)
eventArgs.handled = true
end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 3)
end
