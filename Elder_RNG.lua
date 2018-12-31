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
    include('Elder-Include.lua')
	
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

    
	gear.Gun = "Annihilator"
    gear.Bow = "Yoichinoyumi"
        --gear.Bow = "Hangaku-no-Yumi"
       
    gear.RAbullet = "Eradicating Bullet"
    gear.WSbullet = "Eradicating Bullet"
	gear.MAbullet = "Eradicating Bullet"
	gear.RAArrow = "Gargouille Arrow"
    gear.WSArrow = "Mantid Arrow"
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
	sets.precast.FC = {head="Carmine mask", neck="Voltsurge torque",body="Samnuha coat",hands="Leyline gloves", ring1="Prolix ring", ring2="Kishar ring",
	ear1="Etiolation Earring",ear2="Enchanter earring +1", legs="Rawhide trousers"}
	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {head="Arcadian Beret +1",
		body="Arcadian Jerkin +1",hands="Alruna's Gloves +1", waist="Impulse Belt",legs="Adhemar Kecks",feet="Meghanada jambeaux +2"}
	
	sets.precast.JA['Velocity Shot'] = {body="Amini caban +1"}
	
	sets.precast.JA['Bounty Shot'] = {hands="Amini glovelettes +1"}

	sets.precast.JA['Eagle Eye Shot'] = {head="Orion beret +3",neck="Fotia gorget",ear1="Neritic earring",ear2="Sherida earring",
        body="Herculean Vest",hands="Meghanada gloves +2",ring1="Apate ring",ring2="Meghanada Ring",
        back=gear.BelenusCape_WSD,waist="Fotia Belt",legs="Meghanada chausses +2",feet="Meghanada Jambeaux +2"}

	sets.precast.JA['Barrage'] = {hands="Orion Bracers +2", legs="Desultor tassets"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +2"}
	sets.precast.JA['Camouflage'] = {body="Orion jerkin +2"}
    sets.precast.JA['Scavenge'] = {feet="Orion Socks"}

    sets.precast.WS['Coronach'] = {head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Herculean Vest",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Ilabrat Ring",
        back=gear.Belenus_WSD,waist="Fotia Belt",legs="Meghanada chausses +2",feet=gear.herculeanBoots_RAWSD} 	
		
	sets.precast.WS['Namas Arrow'] = {ammo=gear.WSbullet,head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Herculean Vest",hands="Meghanada gloves +2",ring1="Apate ring",ring2="Meghanada Ring",
        back=gear.Belenus_WSD,waist="Fotia Belt",legs="Meghanada chausses +2",feet=gear.herculeanBoots_RAWSD} 	
																										
																										
	sets.precast.WS['Detonator'] = {ammo=gear.WSbullet,head="Orion beret +3",neck="Fotia gorget",ear1="Ishvara earring",ear2="Sherida earring",
        body="Herculean Vest",hands="Meghanada gloves +2",ring1="Apate ring",ring2="Ilabrat Ring",
        back=gear.Belenus_WSD,waist="Fotia Belt",legs="Meghanada chausses +2",feet=gear.herculeanBoots_RAWSD}

	sets.precast.WS['Last Stand'] = {head="Orion beret +3",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Herculean Vest",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Ilabrat Ring",
        back=gear.Belenus_WSD,waist="Fotia Belt",legs="Meghanada chausses +2",feet=gear.herculeanBoots_RAWSD}
		
	sets.precast.WS['Jishnu\'s Radiance'] = {head="Mummu Bonnet +1",ear1="Moonshade Earring",ear2="Ishvara Earring", neck="Fotia gorget",
		body="Herculean Vest",hands="Meghanada Gloves +2",ring1="Regal Ring",ring2="Begrudging Ring",
		back=gear.Belenus_WSD,waist="Fotia Belt",legs="Mummu Kecks +1",feet="Mummu gamashes +1"}

	sets.precast.WS['Slug Shot'] = {ammo=gear.WSbullet,head="Orion beret +3",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Orion jerkin +3",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.Belenus_WSD,waist="Fotia Belt",legs="Meghanada chausses +2",feet="Meghanada jambeaux +2"}

	sets.precast.WS['Wildfire'] = {head=gear.herculeanHelm_MAB,neck="Sanctity Necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body="Orion jerkin +3",hands="Carmine finger gauntlets +1",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.Belenus_WSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
		
	sets.precast.WS['Trueflight'] = {ammo=gear.MAbullet,head=gear.herculeanHelm_MAB,ear1="Hecate's Earring",ear2="Moonshade Earring", neck="Baetyl Pendant",
		body="Samnuha Coat",hands="Leyline Gloves",ring1="Regal Ring",ring2="Mummu Ring",
		back=gear.Belenus_WSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
		
		
	----Weaponskill Sets with Acc----

	sets.precast.WS['Coronach'].Acc =  set_combine(sets.precast.WS['Coronach'], {ear1="Enervating earring",ear2="Ishvara earring",
        ring1="Regal ring",feet="Meghanada Jambeaux +2"})																							

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Enervating earring",ear2="Ishvara earring",
        ring1="Regal ring",feet="Meghanada Jambeaux +2"})

	sets.precast.WS['Slug Shot'].Acc = set_combine(sets.precast.WS['Slug Shot'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Regal ring +1",feet="Meghanada jambeaux +2"})


	--Midcast Sets--
	sets.midcast.RA = {
		head="Arcadian Beret +1",ear2="Neritic Earring",ear1="Enervating Earring", neck="Iskur Gorget",
		body="Orion Jerkin +2",hands="Meghanada Gloves +2",ring2="Regal Ring",ring1="Ilabrat Ring",
		back=gear.Belenus_TP,waist="Eschan Stone",legs="Adhemar Kecks",feet="Meghanada Jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Orion beret +3",ring1="Nekhen ring", ring2="Regal ring",ear2="Clearview Earring" })


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +2"})




    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    --sets.resting = {main=gear.Staff.HMP, 
      --  body="Gendewitha Bliaut",hands="Serpentes Cuffs",
        --waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {head="Meghanada visor +2",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
		body="Meghanada cuirie +2", hands="Meghanada Gloves +2", ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Eschan stone",legs="Carmine Cuisses +1",feet="Meghanada Jambeaux +2"}

    sets.idle.PDT = {head="Meghanada visor +1",neck="Twilight Torque",ear1="Enervating Earring",ear2="Neritic Earring",
		body="Meghanada cuirie 1", hands="Meghanada Gloves +2", ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Scout's Belt",legs="Carmine Cuisses +1",feet="Meghanada Jambeaux +2"}

	sets.idle.MDT = {ammo="Demonry Stone",
        head="Laeradr helm",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Upsurge earring",
        body="Laeradr breastplate",hands="Eschite Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Strendu mantle",waist="Flume Belt",legs="Kaiser diechlings",feet="Hermes' sandals"}

	    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Loricate torque +1",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Loricate torque +1",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Carmine Cuisses +1"}

   -- sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
	
	--MAKE THIS BUILD INTO PDT BECAUSE OF MIDCAST.RA
	sets.engaged.Ranged = {head="Meghanada visor +2",neck="Loricate Torque +1",ear1="Odnowa Earring",ear2="Odnowa Earring +1",
		body="Meghanada cuirie +2", hands="Meghanada Gloves +2", ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Eschan stone",legs="Carmine Cuisses +1",feet="Meghanada Jambeaux +2"}

    sets.engaged.Melee = {head="Mummu Bonnet +1", neck="Lissome necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Mummu Jacket +1",hands="Adhemar Wristbands",ring2="Petrov Ring",ring1="Epona's Ring",
		back="Letalis Mantle",waist="Cetl Belt",legs="Meghanda Cuisses +2",feet="Mummu gamashes +1"}
		
	sets.engaged.DW = set_combine(sets.engaged.Melee, {body="Adhemar jacket",ear1="Suppanomimi"})

	sets.engaged.Kraken = {head=gear.herculeanHelm_Crit,neck="Combatant's torque",ear1="Telos earring",ear2="Zennaroi earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Ilabrat ring",ring2="Cacoethic ring +1",
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
    set_macro_page(2, 9)
end
