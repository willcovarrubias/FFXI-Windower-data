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
	send_command('alias ohshit input /equip neck "Loricate torque +1"; input /equip ring1 "Vocane ring"; input /equip ring2 "Defending ring";')

    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('Att', 'Acc', 'TH', 'DW', 'Shield')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'Tank', 'Refresh')
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
		head=gear.herculeanHelm_MAB,neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Enchanter earring +1",
        body="Samnuha coat",hands="Leyline gloves",ring1="Rahab Ring",ring2="Prolix ring",
        legs="Rawhide trousers"}
        
   
    -- Precast sets to enhance JAs

    sets.precast.JA['Provoke'] = {neck= "Twilight torque"}

	--WS Sets
	
	--TODO: replace cape with correctly named Include File capes----
	sets.precast.WS['Evisceration'] = {ammo="Jukukik feather",
		head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Sherida earring",
        body="Meghanada cuirie +2",hands="Adhemar wristbands +1",ring1="Epona's ring",ring2="Begrudging Ring",
        back=gear.ToutatisCape_WSD,waist="Fotia Belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}

	sets.precast.WS['Mandalic Stab'] = {ammo="Jukukik feather",
		head="Pillager's bonnet +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Ilabrat Ring",
        back=gear.ToutatisCape_WSD,waist="Fotia Belt",legs=gear.herculeanTrousers_WSD,feet=gear.herculeanBoots_TA}

	sets.precast.WS['Rudra\'s Storm'] = {ammo="Jukukik feather",
		head="Pillager's bonnet +2",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara earring",
        body=gear.herculeanVest_MAB,hands="Meghanada gloves +2",ring1="Regal ring",ring2="Ilabrat Ring",
        back=gear.ToutatisCape_WSD,waist="Grunfeld rope",legs=gear.herculeanTrousers_WSD,feet=gear.herculeanBoots_RAWSD}
		
	sets.precast.WS['Shark Bite'] = {ammo="Jukukik feather",
		head="Pillager's bonnet +2",neck="Fotia gorget",ear1="Moonshade earring",ear2="Ishvara earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Regal ring",ring2="Ilabrat Ring",
        back=gear.ToutatisCape_WSD,waist="Fotia Belt",legs=gear.herculeanTrousers_WSD,feet=gear.herculeanBoots_TA}
	
		
	sets.precast.WS['Aeolian Edge'] = {
		head=gear.herculeanHelm_MAB,neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body=gear.herculeanVest_MAB,hands="Leyline gloves",ring1="Dingir ring",ring2="Ilabrat Ring",
        back=gear.ToutatisCape_WSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}

	
    sets.precast.WS.Rudra = sets.precast.WS['Rudra\'s Storm']

    -- Midcast Sets
    
    --sets.midcast.FastRecast = {
     --   head="Nahtirah Hat",ear2="Enchanter earring +1",
      --  body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
      --  back="Swith cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
	  
	  
	sets.midcast['Enfeebling Magic'] = {
		head=gear.herculeanHelm_MAB,neck="Sanctity necklace",ear1="Friomisi earring",ear2="Moonshade earring",
        body=gear.herculeanVest_MAB,hands="Leyline gloves",ring1="Dingir ring",ring2="Ilabrat Ring",
        back=gear.ToutatisCape_WSD,waist="Eschan stone",legs=gear.herculeanTrousers_MAB,feet=gear.herculeanBoots_MAB}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {ammo="Staunch tathlum",
		head="Meghanada visor +2",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Mummu kecks +2",feet="Jute boots +1"}

    sets.idle.Tank = {ammo="Staunch tathlum",
		head="Meghanada visor +2",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_DT,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Mummu kecks +2",feet="Jute boots +1"}
		
	sets.idle.Refresh = {ammo="Staunch tathlum",
		head="Rawhide mask",neck="Loricate torque +1",ear1="Thureous earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands=gear.herculeanGloves_Refresh,ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Rawhide trousers",feet="Jute boots +1"}
		    
        
    sets.Kiting = {feet="Jute boots +1"}

    -- Engaged sets
	--TODO: replace cape with correctly named Include File capes----
    sets.engaged.Att = {ammo="Yamarang",
		head="Dampening Tam",neck="Anu torque",ear1="Sherida earring",ear2="Brutal Earring",
        body="Adhemar jacket",hands="Adhemar wristbands",ring1="Epona's ring",ring2="Petrov Ring",
        back=gear.ToutatisCape_STP,waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.engaged.Acc = {ammo="Yamarang",
		head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Cacoethic ring +1",ring2="Regal ring",
        back=gear.ToutatisCape_STP,waist="Eschan stone",legs="Mummu kecks",feet=gear.herculeanBoots_TA}

	sets.engaged.TH = {ammo="Yamarang",
		head="Dampening Tam",neck="Anu torque",ear1="Sherida earring",ear2="Brutal Earring",
        body="Adhemar jacket",hands="Plunderer's armlets +1",ring1="Epona's ring",ring2="Petrov Ring",
        back=gear.ToutatisCape_STP,waist="Windbuffet belt +1",legs="Samnuha tights",feet="Skulker's poulaines +1"}

	sets.engaged.DW = {ammo="Yamarang",
		head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Suppanomimi",ear2="Sherida earring",
        body="Adhemar jacket +1",hands="Floral gauntlets",ring1="Epona's ring",ring2="Petrov Ring",
        back=gear.ToutatisCape_STP,waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.engaged.Shield = {ammo="Yamarang",
		head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Telos earring",ear2="Sherida Earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Cacoethic ring +1",ring2="Ilabrat Ring",
        back=gear.ToutatisCape_STP,waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

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
    set_macro_page(1, 4)
end
