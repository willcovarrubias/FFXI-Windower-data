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

	state.OffenseMode:options('Ranged','Melee')
	state.RangedMode:options('Normal', 'Acc')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle')
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
	sets.precast.FC = {head="Carmine mask", neck="Baetyl pendant",body="Samnuha coat",hands="Leyline gloves", ring1="Prolix ring", ring2="Kishar ring",
	ear1="Etiolation Earring",ear2="Enchanter earring +1", legs="Rawhide trousers"}
	
	-- Ranged sets (snapshot)
	
	sets.precast.CorsairRoll = {head="Lanun Tricorne", body="Lanun frac",hands="Chasseur's Gants",neck="Regal Necklace",
    left_ring="Luzaf's ring", legs="Desultor tassets", back="Camulus's Mantle"
	}
	
	sets.precast.RA = {
		head="Amini gapette",
		body="Skopos jerkin",hands="Alruna's gloves +1", 
		back="Camulus's mantle",waist="Impulse Belt",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.precast.JA['Random Deal'] = {body="Lanun frac"}
	
	    
	sets.precast.WS['Last Stand'] = {head="Meghanada visor +1",neck="Fotia gorget",ear1="Moonshade earring",ear2="Enervating earring",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Mummu ring",ring2="Ilabrat ring",
        back="Camulus's mantle",waist="Fotia Belt",legs="Meghanada chausses +2",feet="Meghanada jambeaux +2"}

	sets.precast.WS['Wildfire'] = {head={ name="Herculean Helm", augments={'Mag. Acc.+17','Weapon skill damage +5%','DEX+9','"Mag.Atk.Bns."+7',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Crit. hit damage +3%','"Mag.Atk.Bns."+10',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+16','Crit.hit rate+2','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Hecate's Earring",
    left_ring="Apate Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10',}},}
		
	sets.precast.WS['Leaden Salute'] = {head={ name="Herculean Helm", augments={'Mag. Acc.+17','Weapon skill damage +5%','DEX+9','"Mag.Atk.Bns."+7',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+13','"Mag.Atk.Bns."+14','"Fast Cast"+3','"Dual Wield"+4',}},
    hands="Meg. Gloves +2",
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Crit. hit damage +3%','"Mag.Atk.Bns."+10',}},
    feet={ name="Herculean Boots", augments={'Mag. Acc.+16','Crit.hit rate+2','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    right_ear="Hecate's Earring",
    left_ring="Apate Ring",
    right_ring="Ilabrat Ring",
    back={ name="Camulus's Mantle", augments={'Rng.Acc.+20 Rng.Atk.+20','"Snapshot"+10',}},}
		
	sets.precast.WS['Savage Blade'] = {range={ name="Compensator", augments={'DMG:+15','Rng.Acc.+15','Rng.Atk.+15',}},
    head={ name="Herculean Helm", augments={'Mag. Acc.+17','Weapon skill damage +5%','DEX+9','"Mag.Atk.Bns."+7',}},
    body="Laksa. Frac +3",
    hands="Meg. Gloves +2",
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Weapon skill damage +3%','AGI+5','Rng.Acc.+4','Rng.Atk.+4',}},
    neck="Ire Torque +1",
    waist="Metalsinger Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Regal Ring",
    right_ring="Rufescent Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},}
		
	----Weaponskill Sets with Acc----
																							

	sets.precast.WS['Last Stand'].Acc = set_combine(sets.precast.WS['Last Stand'], {ear1="Enervating earring",ear2="Telos earring",
        ring1="Hajduk ring +1",feet="Meghanada jambeaux +2"})


	--Midcast Sets--
	sets.midcast.RA = {
		head="Meghanada visor +1",neck="Iskur gorget",ear1="Neritic earring",ear2="Enervating earring",
		body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Mummu ring",ring2="Ilabrat ring",
		back="Camulus's mantle",waist="Eschan stone",legs="Adhemar kecks",feet="Meghanada jambeaux +2"}
	
	sets.midcast.RA.Acc = set_combine(sets.midcast.RA,
		{head="Orion beret +3",neck="Combatant's torque",ring1="Regal ring", ring2="Hajduk ring +1",
		hands="Meghanada gloves +2",back=gear.belenusCape_STP})


	--Barrage Set--
	sets.buff.Barrage = set_combine(sets.midcast.RA, {hands="Orion Bracers +3"})   
      
    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {head="Meghanada visor +1",neck="Twilight torque",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine cuisses +1",feet="Meghanada jambeaux +2"}


    sets.Kiting = {feet="Jute boots +1"}


	sets.engaged.Ranged = {head="Meghanada visor +1",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Meghanada cuirie +2",hands="Meghanada gloves +2",ring1="Vocane Ring",ring2="Defending ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine cuisses +1",feet="Meghanada jambeaux +2"}

    sets.engaged.Melee = {head="Mummu bonnet +2",neck="Lissome necklace",ear1="Steelflash earring",ear2="Bladeborn earring",	
        body="Mummu jacket +2",hands="Adhemar wristbands",ring1="Regal ring",ring2="Epona's ring",
        back="Letalis mantle",waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}


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
