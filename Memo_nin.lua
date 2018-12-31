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
	send_command('alias dps input /equip main "Heishi Shorinken"; input /equip sub "Kanaria";' )
	send_command('alias crit input /equip main "Trainee burin"; input /equip sub "Kraken club";' )
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Att', 'Acc', 'DW', 'Hybrid')
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

  	sets.precast.FC = {ammo="Sapience orb",
	head=gear.herculeanHelm_DT,neck="Baetyl Pendant",body="Samnuha coat", ring1="Prolix ring", ring2="Kishar ring",ear1="Etiolation Earring",ear2="Enchanter earring +1", 
	hands="Leyline gloves",legs="Rawhide trousers"}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail +3"})

    sets.precast.JA['Provoke'] = {
		neck="Unmoving collar +1", ear1="Cryptic earring", ear2="Pluto's pearl",
		body="Emet harness +1", hands="Kurys gloves", ring1="Eihwaz ring", ring2="Petrov ring",
		back="Reiki cloak", waist="Goading belt"}


	--WS Sets

	sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
		head="Hachiya hatsuburi +3", neck="Sanctity Necklace", ear1="Friomisi Earring", ear2="Moonshade Earring",
		body=gear.herculeanVest_MAB, hands="Leyline Gloves", ring1="Regal Ring", ring2="Dingir Ring",
		back=gear.AndartiaMantle_WSD,  waist="Eschan Stone", legs=gear.herculeanTrousers_MAB, feet=gear.herculeanBoots_MAB}
		
	sets.precast.WS['Blade: Chi'] = {ammo="Seeth. Bomblet +1",
		head="Hachiya hatsuburi +3", neck="Sanctity Necklace", ear1="Friomisi Earring", ear2="Moonshade Earring",
		body=gear.herculeanVest_MAB, hands="Leyline Gloves", ring1="Regal Ring", ring2="Dingir Ring",
		back=gear.AndartiaMantle_WSD,  waist="Eschan Stone", legs=gear.herculeanTrousers_MAB, feet=gear.herculeanBoots_MAB}

	sets.precast.WS['Blade: Ten'] = {ammo="Seething bomblet +1",
		head="Hachiya hatsuburi +3",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body=gear.herculeanVest_MAB,hands=gear.herculeanGloves_WSD,ring1="Regal ring",ring2="Ilabrat Ring",
		back=gear.AndartiaMantle_WSD,waist="Grunfeld belt",legs="Hizamaru hizayoroi +2",feet=gear.herculeanBoots_RAWSD}
		
	sets.precast.WS['Blade: Shun'] = {ammo="Seething bomblet +1",
		head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Brutal Earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Epona's Ring",
		back=gear.AndartiaMantle_DA,waist="Fotia belt",legs="Samnuha tights",feet=gear.herculeanBoots_TA}
		
	sets.precast.WS['Blade: Hi'] = {ammo="Seething bomblet +1",
		head="Hachiya hatsuburi +3",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Kendatsuba samue",hands=gear.herculeanGloves_WSD,ring1="Regal ring",ring2="Begrudging Ring",
		back=gear.AndartiaMantle_WSD,waist="Grunfeld belt",legs="Hizamaru hizayoroi +2",feet=gear.herculeanBoots_RAWSD}
		
	
    -- Midcast Sets
    
    sets.midcast.FastRecast = {back="Andartia's mantle",feet="Hattori Kyahan +1"}

 	sets.midcast.Utsusemi = {back="Andartia's mantle",hands="Mochizuki tekko +2",feet="Hattori Kyahan +1"}
	
	sets.midcast.ElementalNinjutsu = {
        head=gear.herculeanHelm_MAB,neck="Sanctity necklace",ear1="Friomisi earring",ear2="Novio earring",
        body="Samnuha coat",hands="Leyline gloves",ring1="Shiva ring +1",ring2="Dingir ring",
        back="",waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}

	sets.midcast.NinjutsuDebuff = {ammo="Yamarang",
        head="Hachiya Hatsuburi +3",neck="Sanctity necklace",ear1="Dignitary's earring",ear2="Enchanter earring +1",
        body="Samnuha coat",hands="Mochizuki Tekko +2",ring1="Regal ring",ring2="Etana ring",
        back="",waist="Eschan stone",legs="Mochizuki hakama +1",feet=gear.herculeanBoots_MAB}

	sets.midcast.NinjutsuBuff = {head="Hachiya Hatsuburi +3",neck="Incanter's torque",back="Yokaze Mantle", hands="Mochizuki tekko +2"}
		
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
    sets.idle = {ammo="Staunch tathlum",
		head=gear.herculeanHelm_DT,neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Emet Harness +1",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Danzo sune-ate"}

    sets.idle.Tank = {ammo="Staunch tathlum",
		head=gear.herculeanHelm_DT,neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Emet Harness +1",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Amm greaves"}
	
    sets.Kiting = {feet="Danzo sune-ate"}


    -- Engaged sets
 
    -- Basic set for if no TP weapon is defined. ('Att', 'Acc', 'DW', 'Hybrid')
    sets.engaged.Att = {ammo="Seki shuriken",
		head="Adhemar bonnet +1",neck="Moonlight nodowa",ear1="Telos earring",ear2="Brutal Earring",
        body="Kendatsuba samue",hands="Adhemar wristbands +1",ring1="Epona's ring",ring2="Petrov Ring",
        back=gear.AndartiaMantle_DA,waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.engaged.Acc = {ammo="Seki shuriken",
		head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Tatenashi haramaki +1",hands="Adhemar wristbands +1",ring1="Regal ring",ring2="Cacoethic ring +1",
        back=gear.AndartiaMantle_DA,waist="Grunfeld rope",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

	sets.engaged.DW = {ammo="Seki shuriken",
		head="Ryuo somen",neck="Moonlight nodowa",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mochizuki Chainmail +3",hands="Floral gauntlets",ring1="Epona's ring",ring2="Petrov Ring",
        back=gear.AndartiaMantle_DA,waist="Reiki yotai",legs="Samnuha tights",feet="Hizamaru sune-ate +2"}

	sets.engaged.Hybrid = {ammo="Seki shuriken",
		head=gear.herculeanHelm_DT,neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Emet Harness +1",hands=gear.herculeanGloves_DT,ring1="Vocane ring",ring2="Defending ring",
        back="Moonbeam cape",waist="Flume belt +1",legs="Mummu kecks +2",feet="Amm greaves"}





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
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
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
    set_macro_page(1, 12)
end
