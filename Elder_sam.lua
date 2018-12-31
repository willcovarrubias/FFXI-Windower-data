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
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
    state.Buff.Sekkanoki = buffactive.Sekkanoki or false
    state.Buff.Sengikori = buffactive.Sengikori or false
    state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false

    include('Elder-Include.lua')
	
	send_command('alias doji input /equip main "Dojikiri Yasutsuna";' )
	send_command('alias soboro input /equip main "Norifusa";' )
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal', 'Tank', 'Hybrid')
    state.IdleMode:options('Normal', 'Tank')
	state.WeaponskillMode:options('Normal','Weak')
    
-- Additional local binds

	select_default_macro_book()
    --update_combat_form()
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
    --send_command('unbind ^`')
    --send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido kabuto +2",hands="Sakonji Kote",back=gear.Smertrios_WSD}
    sets.precast.JA['Warding Circle'] = {head="Wakido kabuto +2"}
    sets.precast.JA['Blade Bash'] = {}--hands="Sakonji Kote"}

    sets.precast.FC = {ammo="Sapience Orb",
        neck="Voltsurge Torque",ear1="Etiolation Earring",ear2="Enchanter earring +1",
        hands="Leyline Gloves",ring1="Rahab ring",ring2="Prolix Ring",
        --legs="Arjuna Breeches"
        }
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
    head={ name="Valorous Mask", augments={'Accuracy+24 Attack+24','Weapon skill damage +3%','STR+10','Accuracy+4','Attack+1',}},
    body={ name="Valorous Mail", augments={'Accuracy+24','Weapon skill damage +4%','AGI+7',}},
    hands={ name="Valorous Mitts", augments={'Weapon skill damage +3%','STR+10','Accuracy+15','Attack+8',}},
    legs="Wakido haidate +3",
    feet={ name="Valorous Greaves", augments={'Attack+29','Weapon skill damage +4%','AGI+4','Accuracy+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Ifrit Ring",
    right_ring="Apate Ring",
    back={ name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Kasha'] = set_combine(sets.precast.WS, {})    

    sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {})
    
    sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {})
   
    sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {})

    sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {
        head="Flamma zucchetto +2",body="Flamma Korazin +2",hands="Flamma manopolas +2",legs="Flamma Dirs +1",feet="Flamma Gambieras +2"}) --MAcc

    sets.precast.WS['Tachi: Jinpu'] = {ammo="Knobkierrie",
        head=gear.valorousMask_WSD,neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Founder's Breastplate",hands=gear.valorousMitts_MAB,ring1="Niqmaddu Ring",ring2="Ifrit Ring +1",
        back=gear.Smertrios_WSD,waist="Fotia Belt",legs="Wakido haidate +3",feet="Founder's Greaves"}
		
	sets.precast.WS['Tachi: Jinpu'].Weak = {
	head="Flamma zucchetto +2",body="Flamma Korazin +2",hands="Flamma manopolas +2",legs="Flamma Dirs +1",feet="Flamma Gambieras +2"}

   
    -- Midcast Sets
    sets.midcast.FastRecast = {}

    sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
        head="Flamma zucchetto +2",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Flamma Korazin +2",hands="Flamma manopolas +2",ring1="Evanescence Ring",ring2="Rahab Ring",
        waist="Goading Belt",legs="Flamma Dirs +1",feet="Flamma Gambieras +2"}

    sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {ear2="Friomisi Earring",ring1="Petrov Ring",ring2="Eihwaz Ring"})

    sets.midcast['Enfeebling Magic'] = sets.midcast['Dark Magic']

    sets.midcast.Poison = sets.midcast.Stun
    
    -- Sets to return to when not performing an action.
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {ammo="Staunch Tathlum",
		head="Wakido kabuto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Telos Earring",
		body="Wakido domaru +2",hands="Wakido kote +2",ring1="Vocane Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Wakido haidate +3",feet="Danzo Sune-ate"}
		
    sets.idle.Tank = {ammo="Staunch Tathlum",
		head="Wakido kabuto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Telos Earring",
		body="Hizamaru Haramaki +2",hands="wakido kote +2",ring1="Vocane Ring",ring2="Defending Ring",
		back="Moonbeam Cape",waist="Flume Belt",legs="Wakido haidate +3",feet="Danzo Sune-ate"}
    sets.Kiting = {feet="Danzo Sune-ate"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    --Currently Need 107 STP for 3hit after WS
    sets.engaged = {ammo="Ginsen",
    head="Flam. Zucchetto +2",
    body="Wakido Domaru +2",
    hands="Wakido Kote +2",
    legs="Wakido Haidate +3",
    feet="Flam. Gambieras +2",
    neck="Lissome necklace",
    waist="Ioskeha Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Flamma Ring",
    right_ring="Petrov Ring",
    back={ name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}}
		
    sets.engaged.Tank = {ammo="Ginsen", 
		head="Flamma zucchetto +2",neck="Asperity necklace",ear1="Brutal Earring",ear2="Telos Earring",
		body="Kasuga Domaru +1",hands="Flamma manopolas +2",ring1="Niqmaddu Ring",ring2="Petrov Ring",
		back="Moonbeam cape", waist="Ioskeha Belt",legs="Wakido haidate +3",feet="Flamma Gambieras +2"}
    
	sets.engaged.Hybrid = {ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2", neck="Twilight Torque", ear1="Odnowa Earring +1", ear2="Telos Earring",
		body="Wakido Domaru +2", hands="Wakido Kote +2", ring1="Vocane Ring", ring2="Defending Ring",
		back="Moonbeam Cape", waist="Ioskeha Belt",legs="Wakido Haidate +3", feet="Amm Greaves"}

    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kasuga Sune-ate +1"}
    sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate +1"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)

end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type:lower() == 'weaponskill' then
        if state.Buff.Sekkanoki then
            equip(sets.buff.Sekkanoki)
        end
        if state.Buff.Sengikori then
            equip(sets.buff.Sengikori)
        end
        if state.Buff['Meikyo Shisui'] then
            equip(sets.buff['Meikyo Shisui'])
        end
    end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

function job_status_change(new_status, old_status)
    if new_status == 'Engaged' then
        --determine_haste_group()
        send_command('alias autows awsroot')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    update_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function update_combat_form()

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()

set_macro_page(1, 11)
end
