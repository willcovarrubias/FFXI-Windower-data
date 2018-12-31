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
    include('Memo-Include.lua')
	
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
	state.IdleMode:options('Idle', 'DT')
	state.WeaponskillMode:options('Normal','Acc')
    
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
	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
	--AF3 reforged head //maybe
	--Adhemar kecks
		head="Amini gapette",
		body="Amini caban +1",hands="Carmine finger gauntlets +1", 
		back=gear.belenusCape_Snap,waist="Impulse Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.precast.JA['Velocity Shot'] = {body="Amini caban +1"}
	
	sets.precast.JA['Bounty Shot'] = {hands="Amini glovelettes +1"}

	sets.precast.JA['Eagle Eye Shot'] = {head="Meghanada visor +2",neck="Iskur gorget",ear1="Telos earring",ear2="Enervating earring",
		body="Orion jerkin +3",hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Dingir ring",
		back=gear.belenusCape_WSD,waist="Yemaya belt",legs="Arcadian braccae +2",feet="Meghanada jambeaux +2"}

	sets.precast.JA['Barrage'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Camouflage'] = {body="Orion jerkin +3"}
    
	---WSD WS---
    sets.precast.WS['Coronach'] = {	head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.belenusCape_WSD,waist="Fotia Belt",legs="Arcadian braccae +2",feet=gear.herculeanBoots_RAWSD} 	
		
	sets.precast.WS['Namas Arrow'] = {	head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.belenusCape_WSD,waist="Fotia Belt",legs="Arcadian braccae +2",feet=gear.herculeanBoots_RAWSD} 																											
	
	sets.precast.WS['Detonator'] = {head="Orion beret +3",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Orion jerkin +3",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.belenusCape_WSD,waist="Fotia Belt",legs="Arcadian braccae +2",feet=gear.herculeanBoots_RAWSD}		

	sets.precast.WS['Last Stand'] = {head="Orion beret +3",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Orion jerkin +3",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.belenusCape_WSD,waist="Fotia Belt",legs="Arcadian braccae +2",feet=gear.herculeanBoots_RAWSD}

	sets.precast.WS['Slug Shot'] = {head="Orion beret +3",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Orion jerkin +3",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir Ring",
        back="Sylvan chlamys",waist="Fotia Belt",legs="Arcadian braccae +2",feet="Meghanada jambeaux +2"}
		
	---MAB WS---
	sets.precast.WS['Wildfire'] = {head=gear.herculeanHelm_MAB,neck="Sanctity Necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Orion jerkin +3",hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.belenusCape_WSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
		
	sets.precast.WS['Trueflight'] = {head=gear.herculeanHelm_MAB,neck="Sanctity Necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body=gear.herculeanVest_MAB,hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.belenusCape_WSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
	
	---Crit WS---
	sets.precast.WS['Jishnu\'s Radiance'] = {head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Meghanada cuirie +2",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Begrudging Ring",
        back=gear.belenusCape_Crit,waist="Fotia Belt",legs="Jokushu haidate",feet="Thereoid greaves"}
		
	sets.precast.WS.Jishnu = sets.precast.WS['Jishnu\'s Radiance']
	
	sets.precast.WS['Heavy Shot'] = {head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Begrudging Ring",
        back=gear.belenusCape_WSD,waist="Fotia Belt",legs="Darraigner's brais",feet="Thereoid greaves"}
		
		
	----Weaponskill Sets with Acc----

	sets.precast.WS['Coronach'].Acc =  set_combine(sets.precast.WS['Coronach'], {ear1="Telos earring",ear2="Enervating earring",
        feet="Meghanada jambeaux +2"})																							

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Telos earring",ear2="Enervating earring",
        feet="Meghanada jambeaux +2"})

	sets.precast.WS['Slug Shot'].Acc = set_combine(sets.precast.WS['Slug Shot'], {ear1="Telos earring",ear2="Enervating earring",
        feet="Meghanada jambeaux +2"})


	--Midcast Sets--
	sets.midcast.RA = {
		head="Arcadian beret +2",neck="Iskur gorget",ear1="Telos earring",ear2="Enervating earring",
		body="Arcadian jerkin +3",hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Ilabrat ring",
		back=gear.belenusCape_STP,waist="Yemaya belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Orion beret +3",neck="Combatant's torque",ring1="Regal ring", ring2="Cacoethic ring +1",
		hands="Meghanada gloves +2",back=gear.belenusCape_STP})


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +3"})

    
    -- Sets to return to when not performing an action.
        
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Jute boots +1"}


	sets.idle.DT = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Jute boots +1"}

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

    -- Engaged sets
    
	sets.engaged.Ranged = {head="Meghanada visor +2",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Jute boots +1"}

    sets.engaged.Melee = {head="Adhemar bonnet +1",neck="Asperity necklace",ear1="Telos earring",ear2="Sherida earring",	
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Petrov ring",ring2="Epona's ring",
        back="Lupine cape",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}
		
	sets.engaged.DW = set_combine(sets.engaged.Melee, {body="Adhemar jacket +1",ear1="Suppanomimi"})

	sets.engaged.Kraken = {head="Meghanada visor +2",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Ilabrat ring",
        back="Lupine cape",waist="Goading belt",legs=gear.herculeanTrousers_Crit,feet="Meghanada jambeaux +2"}

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
    set_macro_page(1, 3)
end
