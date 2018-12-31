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
    include('Memosan-Include.lua')
	
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

    
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()



	
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
	sets.precast.FC = {head="Carmine mask", neck="Baetyl Pendant",body="Dread Jupon",hands="Leyline gloves", ring1="Prolix ring", ring2="Kishar ring",
	ear1="Etiolation Earring",ear2="Enchanter earring +1", legs="Rawhide trousers"}
	
	sets.precast.CorsairRoll = {head="Lanun Tricorne", body="Lanun frac +1",hands="Chasseur's Gants",neck="Regal Necklace",
    left_ring="Luzaf's ring", legs="Desultor tassets", back="Camulus's Mantle"
	}
	
	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head="Taeon chapeau",
		body="Taeon tabard",hands="Carmine finger gauntlets", 
		back=gear.CamulusMantle_Snap,waist="Impulse Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
			
	sets.precast.JA['Dark Shot'] = {head="Mummu bonnet +2",neck="Sanctity necklace",ear1="Hermetic earring",ear2="Pensee earring",
        body="Mummu jacket +2",hands="Mummu wrists +2",ring1="Mummu ring",ring2="Kishar Ring",
        back=gear.CamulusMantle_MagWSD,waist="Sveltesse gouriz +1",legs="Mummu kecks +2",feet="Mummu gamashes +1"}
		
	sets.precast.JA['Light Shot'] = sets.precast.JA['Dark Shot']
	
	sets.precast.JA['Fire Shot'] = {head=gear.herculeanHelm_MAB,neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body=gear.herculeanVest_MAB,hands="Carmine finger gauntlets",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_MagWSD,waist="Aquiline belt",legs=gear.herculeanTrousers_MAB,feet="Lanun bottes +2"}
		
	sets.precast.JA['Ice Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Wind Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Earth Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Thunder Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Water Shot'] = sets.precast.JA['Fire Shot']
	
	sets.precast.JA['Wild Card'] = {feet="Lanun bottes +1"}
	
	sets.precast.JA['Random Deal'] = {body="Lanun frac +1"}
	
	sets.precast.WS['Hot Shot'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Ponente Belt",legs=gear.herculeanTrousers_RAWSD,feet=gear.herculeanBoots_RAWSD}
	
	
	sets.precast.WS['Circle Blade'] = {head="Lilitu headpiece",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body=gear.herculeanVest_WSD,hands="Meghanada gloves +2",ring1="Regal ring",ring2="Shukuyu ring",
        back=gear.CamulusMantle_WSD,waist="Olseni belt",legs=gear.herculeanTrousers_WSD,feet="Lanun bottes +2"}
	
	sets.precast.WS['Detonator'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Ponente Belt",legs=gear.herculeanTrousers_WSD,feet="Lanun bottes +2"}
		
	sets.precast.WS['Heavy Shot'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Ponente Belt",legs=gear.herculeanTrousers_RAWSD,feet=gear.herculeanBoots_RAWSD}

	sets.precast.WS['Last Stand'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir ring",
        back=gear.CamulusMantle_RAWSD,waist="Ponente Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
		
	sets.precast.WS['Savage Blade'] = {head="Lilitu headpiece",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body=gear.herculeanVest_WSD,hands="Meghanada gloves +2",ring1="Regal ring",ring2="Shukuyu ring",
        back=gear.CamulusMantle_WSD,waist="Metalsinger Belt",legs=gear.herculeanTrousers_WSD,feet="Lanun bottes +2"}
		

	sets.precast.WS['Slug Shot'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Laksamana's frac +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Dingir Ring",
        back=gear.CamulusMantle_RAWSD,waist="Ponente Belt",legs=gear.herculeanTrousers_RAWSD,feet="Meghanada jambeaux +2"}

	sets.precast.WS['Wildfire'] = {head=gear.herculeanHelm_MAB,neck="Baetyl pendant",ear1="Moonshade earring",ear2="Friomisi earring",
        body=gear.herculeanVest_MAB,hands="Carmine finger gauntlets",ring1="Regal ring",ring2="Dingir ring",
        back="Gunslinger's cape",waist="Ponente sash",legs=gear.herculeanTrousers_MAB,feet="Lanun bottes +2"}
		
	sets.precast.WS['Leaden Salute'] = {head="Pixie Hairpin +1",neck="Baetyl pendant",ear1="Moonshade earring",ear2="Friomisi earring",
        body=gear.herculeanVest_MAB,hands="Carmine finger gauntlets",ring1="Archon ring",ring2="Dingir ring",
        back=gear.CamulusMantle_MagWSD,waist=gear.ElementalObi,legs=gear.herculeanTrousers_MAB,feet="Lanun bottes +2"}
		
		
	----Weaponskill Sets with Acc----								

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Telos earring",ear2="Enervating earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})

	sets.precast.WS['Slug Shot'].Acc = set_combine(sets.precast.WS['Slug Shot'], {ear1="Telos earring",ear2="Enervating earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})


	--Midcast Sets--
	sets.midcast.RA = {
		head="Meghanada visor +1",neck="Iskur Gorget",ear1="Neritic earring",ear2="Enervating earring",
		body="Laksamana's frac +2",hands="Carmine finger gauntlets",ring1="Regal ring",ring2="Ilabrat ring",
		back=gear.CamulusMantle_RangeSTP,waist="Aquiline belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Meghanada visor +1",neck="Combatant's torque",ring1="Regal ring", ring2="Hajduk ring +1",
		body="Laksamana's frac +2",hands="Meghanada gloves +2",back=gear.CamulusMantle_RangeSTP})


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands=""})


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {head="Meghanada visor +1",neck="Loricate torque +1",ear1="Odnowa Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine Cuisses",feet="Meghanada jambeaux +2"}


	sets.idle.DT = {head="Meghanada visor +1",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Gelatinous Ring +1",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Mummu kecks +2",feet="Ahosi leggings"}

	sets.idle.Refresh = {head="Rawhide mask",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_Refresh,ring1="Gelatinous Ring +1",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Rawhide trousers",feet=gear.herculeanBoots_Refresh}

    sets.Kiting = {legs="Carmine Cuisses"}

	sets.engaged.Ranged = {head="Meghanada visor +1",neck="Loricate torque +1",ear1="Odnowa Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Gelatinous Ring +1",ring2="Defending Ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine Cuisses",feet="Meghanada jambeaux +2"}

    sets.engaged.Melee = {head="Mummu Bonnet +2",neck="Lissome necklace",ear1="Cessance Earring",ear2="Brutal Earring",	
        body="Adhemar jacket",hands=gear.herculeanGloves_QA,ring1="Petrov Ring",ring2="Epona's ring",
        back=gear.CamulusMantle_MeleeSTP,waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_QA}
	
	sets.engaged.Acc = {head="Mummu bonnet +2",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Mummu jacket +2",hands="Mummu wrists +2",ring1="Regal ring",ring2="Cacoethic ring +1",
        back=gear.CamulusMantle_MeleeSTP,waist="Olseni belt",legs="Mummu kecks +2",feet="Meghanada jambeaux +2"}


end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.en == 'Leaden Salute' then
       gear.default.obi_waist = "Sveltesse gouriz +1"
       if spell.element == world.weather_element or spell.element == world.day_element then
           gear.default.obi_waist = "Hachirin-no-obi"
       end
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
    set_macro_page(1, 2)
end
