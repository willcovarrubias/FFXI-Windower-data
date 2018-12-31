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

	state.OffenseMode:options('Ranged','Melee','Acc')
	state.RangedMode:options('Normal', 'Acc')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'DT', 'Refresh')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	state.WeaponskillMode:options('Normal','Acc')

    -- Debuffs ALT	
	send_command('bind !1 input /darkshot')
	send_command('bind !2 input /leadensalute')
	send_command('bind !3 input /ja "Provoke" <t>')
	send_command('bind !4 input /ma "Glutinous Dart" <t>')
	send_command('bind !5 input /ws "Savage Blade" <t>; input /p   ')
	send_command('bind !6 input /ma "Magic Fruit" <stpc>; input /echo --MAGIC FRUIT--')
	send_command('bind !7 input /ws "Expacion" <t>; input /p    ')
	send_command('bind !8 input /ma "Magic Hammer" <t>')
	send_command('bind !9 input /ma "Sacrifice" <t>')
	send_command('bind !0 input /item "Forbidden Key" <t>')
	send_command('bind !- gs c cycle OffenseMode ')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /hastesamba')
	send_command('bind ^2 input /boxstep')
	send_command('bind ^3 input /reverseflourish')
	send_command('bind ^4 input /ma "Occultation" <me>')
	send_command('bind ^5 input /ma "Subduction" <t>')
	send_command('bind ^6 input /ma "Tenebral Crush" <t>')
	send_command('bind ^7 input /ma "Fantod" <me>')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input /ma "Repose" <t>')
	send_command('bind ^0 input //ohshit')
	send_command('bind ^- input //exec vnm.txt; input /echo --Temp Items--')
	send_command('bind ^= input //exec reward.txt; input /echo --Treasure Items--')
	
	
	
	
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()



	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
	sets.precast.FC = {head="Carmine mask", neck="Baetyl Pendant",body="Samnuha coat",hands="Leyline gloves", ring1="Prolix ring", ring2="Kishar ring",
	ear1="Etiolation Earring",ear2="Enchanter earring +1", legs="Rawhide trousers"}
	
	sets.precast.CorsairRoll = {head="Lanun Tricorne", body="Lanun frac",hands="Chasseur's Gants",neck="Regal Necklace",
    left_ring="Luzaf's ring", legs="Desultor tassets", back="Camulus's Mantle"
	}
	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Taeon chapeau",
		body="Taeon tabard",hands="Carmine finger gauntlets +1", 
		back=gear.CamulusMantle_Snap,waist="Impulse Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
			
	sets.precast.JA['Dark Shot'] = {head="Carmine mask",neck="Sanctity necklace",ear1="Enchanter earring +1",ear2="Dignitary's earring",
        body="Mummu jacket +2",hands="Mummu wrists +2",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,waist="Eschan stone",legs="Mummu kecks +2",feet=gear.herculeanBoots_MAB}
		
	sets.precast.JA['Light Shot'] = sets.precast.JA['Dark Shot']
	
	sets.precast.JA['Fire Shot'] = {head=gear.herculeanHelm_MAB,neck="Baetyl pendant",ear1="Friomisi earring",ear2="Novio earring",
        body="Samnuha coat",hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
		
	sets.precast.JA['Ice Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Wind Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Earth Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Thunder Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Water Shot'] = sets.precast.JA['Fire Shot']

	sets.precast.JA['Barrage'] = {hands=""}
	sets.precast.JA['Shadowbind'] = {hands=""}
	
	sets.precast.WS['Detonator'] = {head="Meghanada visor +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Fotia Belt",legs=gear.herculeanTrousers_RAWSD,feet=gear.herculeanBoots_RAWSD}
		
	sets.precast.WS['Heavy Shot'] = {head="Meghanada visor +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Fotia Belt",legs=gear.herculeanTrousers_RAWSD,feet=gear.herculeanBoots_RAWSD}

	sets.precast.WS['Last Stand'] = {head="Meghanada visor +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Fotia Belt",legs=gear.herculeanTrousers_RAWSD,feet=gear.herculeanBoots_RAWSD}
				
	sets.precast.WS['Savage Blade'] = {
        head=gear.herculeanHelm_WSD,
		neck="Caro Necklace",
		ear1="Odnowa earring +1",
		ear2="Ishvara Earring",
        body="Adhemar Jacket",
		hands="Meghanada gloves +2",
		ring1="Rufescent ring",
		ring2="Ifrit ring",
        --back=gear.RosmertasCape_WSDMG,
		waist="Metalsinger Belt",
		legs=gear.herculeanTrousers_WSD,
		feet=gear.herculeanBoots_WSD
	}
		
	sets.precast.WS['Slug Shot'] = {head="Meghanada visor +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,waist="Fotia Belt",legs=gear.herculeanTrousers_RAWSD,feet="Meghanada jambeaux +2"}

	sets.precast.WS['Wildfire'] = {head=gear.herculeanHelm_MAB,neck="Baetyl pendant",ear1="Friomisi earring",ear2="Novio earring",
        body=gear.herculeanVest_MAB,hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
		
	sets.precast.WS['Leaden Salute']= {
		head="Pixie hairpin +1",
		neck="Sanctity Necklace",
		ear1="Friomisi earring",
		ear2="Novio Earring",
        body="Samnuha coat",
		hands="Carmine finger gauntlets",
		ring1="Archon ring",
		ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,
		waist="Eschan stone",
		gear.herculeanTrousers_RAWSD,
		feet=gear.herculeanBoots_RAWSD
	}
	
	--[[
	{head="Pixie hairpin +1",neck="Baetyl pendant",ear1="Friomisi earring",ear2="Moonshade earring",
        body=gear.herculeanVest_MAB,hands="Carmine finger gauntlets +1",ring1="Archon ring",ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
		]]--
		
	----Weaponskill Sets with Acc----								

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})

	sets.precast.WS['Slug Shot'].Acc = set_combine(sets.precast.WS['Slug Shot'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})


	--Midcast Sets--
	sets.midcast.RA = {
		head="Meghanada visor +2",neck="Iskur gorget",ear1="Enervating earring",ear2="Telos earring",
		body="Mummu jacket +2",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Ilabrat ring",
		back=gear.CamulusMantle_RAWSD,waist="Yemaya belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Meghanada visor +2",neck="Combatant's torque",ring1="Regal ring", ring2="Hajduk ring +1",
		body="Laksamana's frac +2",hands="Meghanada gloves +2",back=gear.CamulusMantle_RAWSD})


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands=""})




    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --sets.resting = {main=gear.Staff.HMP, 
      --  body="Gendewitha Bliaut",hands="Serpentes Cuffs",
        --waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine cuisses +1",feet="Ahosi leggings"}


	sets.idle.DT = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Mummu kecks +2",feet="Ahosi leggings"}

	sets.idle.Refresh = {head="Rawhide mask",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_Refresh,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Rawhide trousers",feet=gear.herculeanBoots_Refresh}
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
        back="Solemnity cape",waist="Flume belt",legs="Mummu kecks +2",feet="Ahosi leggings"}

    sets.engaged.Melee = {head="Dampening Tam",neck="Combatant's torque",ear1="Brutal earring",ear2="Telos earring",	
        body="Adhemar Jacket",hands="Adhemar wristbands +1",ring1="Petrov ring",ring2="Epona's ring",
        back="Lupine cape",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}
	
	sets.engaged.Acc = {head="Mummu bonnet +2",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Mummu jacket +2",hands="Mummu wrists +2",ring1="Regal ring",ring2="Cacoethic ring +1",
        back="Lupine cape",waist="Reiki yotai",legs="Mummu kecks +2",feet="Meghanada jambeaux +2"}




    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
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
    set_macro_page(1, 15)
end
