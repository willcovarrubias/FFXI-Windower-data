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
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Att', 'Acc')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'Tank')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

    
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
		head=gear.herculeanHelm_Crit,neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Enchanter earring +1",
        body="Samnuha coat",hands="Leyline gloves",ring1="Rahab Ring",ring2="Prolix ring",
        legs="Rawhide trousers"}
        
   
    -- Precast sets to enhance JAs

    sets.precast.JA['Provoke'] = {neck= "Twilight torque"}

	--WS Sets
	
	--TODO: replace cape with correctly named Include File capes----
	sets.precast.WS = {ammo="Knobkierre",
    head="Adhemar bonnet +1",
    body="Kendatsuba samue",hands="Adhemar wristbands +1",legs="Hizamaru hizayoroi +2",
    feet={ name="Herculean Boots", augments={'Rng.Acc.+13 Rng.Atk.+13','Weapon skill damage +4%','DEX+9','Rng.Atk.+13',}},
    neck="Fotia Gorget",waist="Fotia Belt",left_ear="Sherida Earring",ear2="Moonshade Earring",
    left_ring="Niqmaddu Ring",right_ring="Regal ring",
    back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MND+1','Mag. Acc.+2','DEF+2',}}}

	sets.precast.WS['Howling Fist'] = {ammo="Knobkierre",
		head=gear.herculeanHelm_MAB,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body=gear.herculeanVest_MAB,hands=gear.herculeanGloves_WSD,ring1="Regal ring",ring2="Niqmaddu Ring",
		back=gear.AndartiaMantle_WSD,waist="Grunfeld belt",legs="Hizamaru hizayoroi +2",feet=gear.herculeanBoots_RAWSD}
		
	sets.precast.WS['Victory Smite'] = {ammo="Ginsen",
		head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Sherida earring",ear2="Moonshade Earring",
        body="Kendatsuba samue",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Niqmaddu Ring",
		back=gear.AndartiaMantle_WSD,waist="Fotia belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

    -- Midcast Sets
    
    --sets.midcast.FastRecast = {
     --   head="Nahtirah Hat",ear2="Enchanter earring +1",
      --  body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
      --  back="Swith cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {ammo="Staunch tathlum",
		head=gear.herculeanHelm_DT,neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Emet harness +1",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Crier's gaiters"}

    sets.idle.Tank = {
		head="",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt +1",legs="Mummu kecks +2",feet=""}
		    
        
    sets.Kiting = {feet="Jute boots +1"}

    -- Engaged sets
	--TODO: replace cape with correctly named Include File capes----
    sets.engaged.Att = {ammo="Ginsen",
    head="Adhemar bonnet +1",body="Kendatsuba samue",hands="Adhemar wristbands +1",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+17 Attack+17','"Triple Atk."+4','DEX+1','Attack+6',}},
    neck="Moonlight nodowa",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Brutal Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Mecisto. Mantle", augments={'Cap. Point+49%','MND+1','Mag. Acc.+2','DEF+2',}}}

	sets.engaged.Acc = {
		head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Meghanada cuirie +2",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Cacoethic ring +1",
        back="Toutatis's cape",waist="Eschan stone",legs=gear.herculeanTrousers_Crit,feet="Meghanada jambeaux +2"}



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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 14)
end
