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

	state.OffenseMode:options('Normal', 'Hybrid', 'Tank')
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
		head="Vishap armet +1",neck="Baetyl Pendant",ear1="Etiolation Earring",ear2="Enchanter earring +1",
        hands="Leyline gloves",ring1="Rahab Ring",ring2="Prolix ring",
        legs="Rawhide trousers"}
        
   
    -- Precast sets to enhance JAs

    sets.precast.JA['Provoke'] = {neck= "Twilight torque"}
	
	sets.precast.JA['Angon'] = {ammo= "Angon"}
	
	sets.precast.JA['Spirit Link'] = {ammo= "Angon", head="Vishap armet +1", ear2="Pratik earring"}
	
	sets.precast.JA['Jump'] = {ammo="Ginsen",
		head="Flamma zucchetto +2",neck="Anu torque",ear1="Sherida earring",ear2="Brutal earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Niqmaddu ring",ring2="Petrov ring",
        back="Brigantia's mantle",waist="Ioskeha belt +1",legs=gear.valorousHose_DA,feet="Flamma gambieras +2"}
		
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
		head="Flamma zucchetto +2",neck="Anu torque",ear1="Sherida earring",ear2="Brutal earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Niqmaddu ring",ring2="Petrov ring",
        back="Brigantia's mantle",waist="Ioskeha belt +1",legs=gear.valorousHose_DA,feet="Flamma gambieras +2"}
		
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flamma zucchetto +2",neck="Anu torque",ear1="Sherida earring",ear2="Brutal earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Niqmaddu ring",ring2="Petrov ring",
        back="Brigantia's mantle",waist="Ioskeha belt +1",legs=gear.valorousHose_DA,feet="Flamma gambieras +2"}
		
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flamma zucchetto +2",neck="Anu torque",ear1="Sherida earring",ear2="Brutal earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Niqmaddu ring",ring2="Petrov ring",
        back="Brigantia's mantle",waist="Ioskeha belt +1",legs=gear.valorousHose_DA,feet="Flamma gambieras +2"}
		
	sets.precast.JA['Call Wyvern'] = {body="Pteroslaver Mail +1"}
	
	sets.precast.JA['Restoring Breath'] = {head="Vishap armet +1"}
	

	--WS Sets
	
	--TODO: replace cape with correctly named Include File capes----
	sets.precast.WS = {ammo="Knobkierrie",
		head=gear.valorousMask_WSD,neck="Fotia gorget",ear1="Sherida earring",ear2="Moonshade earring",
        body=gear.valorousMail_WSD,hands=gear.valorousMitts_MAB,ring1="Niqmaddu ring",ring2="Regal ring",
        back="Brigantia's mantle",waist="Fotia belt",legs=gear.valorousHose_WSD,feet="Sulevia's leggings +2"}

	sets.precast.WS['Camlann\'s Torment'] = {ammo="Knobkierrie",
		head=gear.valorousMask_WSD,neck="Fotia gorget",ear1="Ishvara earring",ear2="Moonshade earring",
        body=gear.valorousMail_WSD,hands=gear.valorousMitts_MAB, ring1="Niqmaddu ring",ring2="Regal ring",
        back="Brigantia's mantle",waist="Fotia belt",legs="Sulevia's cuisses +2",feet="Sulevia's leggings +2"}


    -- Midcast Sets
    
    --sets.midcast.FastRecast = {
     --   head="Nahtirah Hat",ear2="Enchanter earring +1",
      --  body="Vanir Cotehardie",hands="Dynasty Mitts",ring1="Prolix Ring",
      --  back="Swith cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}
    sets.midcast.Dia = {
		head="Vishap armet +1",neck="Sanctity necklace",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Flamma korazin +2",hands="Flamma manopolas +2",ring1="Meridian ring",ring2="Eihwaz ring",
        back="Moonbeam cape",waist="Eschan stone",legs="Flamma dirs +2",feet="Flamma gambieras +2"}
		
	sets.midcast.Barfire = {
		head="Vishap armet +1",neck="Sanctity necklace",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Flamma korazin +2",hands="Flamma manopolas +2",ring1="Meridian ring",ring2="Eihwaz ring",
        back="Moonbeam cape",waist="Eschan stone",legs="Flamma dirs +2",feet="Flamma gambieras +2"}
		
	sets.midcast.Stone = {
		head="Vishap armet +1",neck="Sanctity necklace",ear1="Etiolation earring",ear2="Odnowa earring +1",
        body="Flamma korazin +2",hands="Flamma manopolas +2",ring1="Meridian ring",ring2="Eihwaz ring",
        back="Moonbeam cape",waist="Eschan stone",legs="Flamma dirs +2",feet="Flamma gambieras +2"}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {ammo="Staunch tathlum",
		head="Sulevia's mask +2",neck="Loricate torque +1",ear1="Genmei earring",ear2="Odnowa earring +1",
        body="Sulevia's platemail +2",hands="Sulevia's gauntlets +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt +1",legs="Carmine cuisses +1",feet="Sulevia's leggings +2"}

    sets.idle.Tank = {}
		    
        
    sets.Kiting = {feet="Jute boots +1"}

    -- Engaged sets
	--TODO: replace cape with correctly named Include File capes----
    sets.engaged = {ammo="Ginsen",
		head="Flamma zucchetto +2",neck="Anu torque",ear1="Sherida earring",ear2="Brutal earring",
        body=gear.valorousMail_DA,hands="Flamma manopolas +2",ring1="Niqmaddu ring",ring2="Petrov ring",
        back="Brigantia's mantle",waist="Ioskeha belt +1",legs="Flamma dirs +2",feet="Flamma gambieras +2"}

	sets.engaged.Hybrid = {}

	sets.engaged.Tank = {}

	

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
    set_macro_page(1, 13)
end
