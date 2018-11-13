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
    state.Buff['Sneak Attack'] = buffactive['Sneak Attack'] or false
    state.Buff['Trick Attack'] = buffactive['Trick Attack'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'TH', 'Acc', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	
-- Debuffs ALT	
	send_command('bind !1 input /ja "Provoke" <t>')
	send_command('bind !2 input /ma "Flash" <t>')
	send_command('bind !3 input /ja "Rampart" <me>')
	send_command('bind !4 input /ja "Fealty" <me>')
	send_command('bind !5 input /ja "Haste Samba" <me>')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Esuna" <me>')
	send_command('bind !9 input //exec thf/TA_Rudra.txt')
	send_command('bind !0 input //exec thf/TA_Mandalic.txt')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != input //gs c cycle OffenseMode')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Phalanx" <me>')
	send_command('bind ^F2 input /ma "Enlight" <me>')
	send_command('bind ^F3 input /ma "Reprisal" <me>')
	send_command('bind ^F4 input /ma "Dispel" <t>')
	send_command('bind ^F5 input /ma "Dia II" <t>')
	send_command('bind ^F6 input /ma "Slow" <t>')
	send_command('bind ^F7 input /ma "Paralyze" <t>')
	send_command('bind ^F8 input /ma "Addle" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input /ma "Banish III" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE--')
	

-- Misc CTRL	
	send_command('bind ^1 input /ma "Cure" <st>')
	send_command('bind ^2 input /ma "Cure II" <st>')
	send_command('bind ^3 input /ja "Cure III" <st>')
	send_command('bind ^4 input /ma "Cure IV" <st>')
	send_command('bind ^5 input /ma "Cure V" <t>')
	send_command('bind ^6 input /ma "Cure VI" <t>')
	send_command('bind ^7 input /ja "Shield Bash" <t>')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input //exec thf/SA_Rudra.txt')
	send_command('bind ^0 input //exec thf/SA_Mandalic.txt')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')

    --select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
	ammo="Impatiens",
	waist="Ninurta's Sash",
	ear2="Loquacious Earring",
	ring1="Prolix Ring",
	ring2="Veneficium Ring"
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {neck="Stone Gorget", waist="Siegel Sash"})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {
	ear1="Nourishing earring +1", 
	ear2="Mendicant's earring"})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {ammo="Incantor Stone"})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
    sets.precast.JA.Provoke = {
		ammo="Paeapua",
        back="Cerb. Mantle +1", 
		ring1="Eihwaz ring",
		feet="Chelona Boots"
	}

	
    
    -- Weaponskill sets

    sets.precast.WS['Savage Blade'] = {
        head="Sulevia's mask",
		neck="Fotia Gorget",
		ear2="Brutal Earring",
        body="Souveran Cuirass",
		hands="Sulevia's gauntlets",
		ring1="Apate Ring",
		ring2="Pyrosoul Ring",
        back="Cerb. Mantle +1",
		waist="Fotia Belt",
		legs="Sulvia's Cuisses",
		feet="Sulevia's Leggings"
	}
		
	sets.precast.WS['Sanguine Blade'] = {
		neck="Fotia Gorget",
		ear1="Novio Earring",
		ear2="Hecate's Earring",
		ring1="Apate Ring",
		ring2="Acumen Ring",
		waist="Fotia Belt"
		}
			

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
		ammo="Impatiens",
		ear2="Loquacious Earring",
		waist="Ninurta's Sash",
		ring1="Prolix Ring",
		ring2="Veneficium Ring"
	}
    
    -- Cure sets

    sets.midcast.Cure = {	
		neck="Phalaina Locket",
		ear1="Nourishing Earring +1",
		ear2="Mendicant's Earring",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Cerb. Mantle +1",
		waist="Asklepian Belt",
	}


    sets.midcast['Ninjutsu Magic'] = {
        head="Wayfarer circlet",neck="Stoicheion medal",ear1="Hecate's earring",ear2="Mendicant's Earring",
        body="Wayfarer rob",hands="Vanya cuffs",ring1="Strendu Ring", ring2="Acumen ring",
        back="Hecate's cape",waist="Witch's Sash",legs="Wayfarer slops",feet="Vanya clogs"}



    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		ammo="Homiliary",
		head="Sulevia's mask",
		neck="Creed Collar",
		ear1="Moonshade Earring",
		ear2="Creed Earring",
        body="Souveran Cuirass",
		hands="Sulevia's gauntlets",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
        back="Atheling mantle",
		waist="Nierenschutz",
		legs="Crimson Cuisses",
		feet="Sulevia's Leggings"
    }   

		
    sets.idle.PDT = {
		ammo="Angha Gem",
		head="Sulevia's mask",
		neck="Twilight Torque",
		ear1="Moonshade Earring",
		ear2="Creed Earring",
        body="Souveran Cuirass",
		hands="Sulevia's gauntlets",
		ring1="Eihwaz ring",
		ring2="Dark Ring",
        back="Atheling mantle",
		waist="Nierenschutz",
		legs="Crimson Cuisses",
		feet="Sulevia's Leggings"
	}
    
    sets.idle.MDT = {
		ammo="Demonry Stone",
		head="Sulevia's mask",
		neck="Twilight Torque",
		ear1="Moonshade Earring",
		ear2="Creed Earring",
        body="Souveran Cuirass",
		hands="Redan Gloves",
		ring1="Archon Ring",
		ring2="Dark Ring",
        back="Atheling mantle",
		waist="Nierenschutz",
		legs="Crimson Cuisses",
		feet="Sulevia's Leggings"
	}
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        --head="Gendewitha Caubeen",neck="Twilight Torque",
        --body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        --head="Nahtirah Hat",neck="Twilight Torque",
        --body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        --back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    --sets.Kiting = {feet="Herald's Gaiters"}

    --sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged.Normal = { ammo="Angha gem",
        head="Sulevia's mask",neck="Twilight Torque",ear1="Creed Earring",ear2="Brutal earring",
        body="Meghanada Cuirie",hands="Meghanada Gloves",ring1="Apate ring",ring2="Dark Ring",
        back="Mollusca Mantle",waist="Sailfi belt +1",legs="Sulevia's Cuisses",feet="Meghanada jambeaux"}
		
    sets.engaged.TH = { ammo="Angha gem",
        head="Sulevia's mask",neck="Agasaya's collar",ear1="Suppanomimi",ear2="Brutal earring",
        body="Meghanada Cuirie",hands="Plunderer's armlets",ring1="Demonry ring",ring2="Epona's Ring",
        back="Canny Cape",waist="Sailfi belt +1",legs="Meghanada chausses",feet="Skulker's poulaines"}
		
	sets.engaged.Acc = { ammo="Hasty pinion +1",
        head="Sulevia's mask",neck="Peacock charm",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Souveran cuirass",hands="Sulevia's gauntlets",ring1="Mars's ring",ring2="Apate Ring",
        back="Atheling mantle",waist="Sailfi belt +1",legs="Sulevia's cuisses",feet="Sulevia's leggings"}
	
	sets.engaged.PDT = { ammo="Angha gem",
        head="Sulevia's mask",neck="Twilight collar",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Meghanada cuirie",hands="Meghanada gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back="Canny Cape",waist="Phasmida Belt",legs="Meghanada chausses",feet="Meghanada jambeaux"}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Sneak Attack'] = hands="Assassin's Armlets +2",feet="Skulker's poulaines"}
		
	--sets.buff['Trick Attack'] = {hands="Assassin's Armlets +2",feet="Skulker's poulaines"}
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
        equip(sets.buff['Sneak Attack'])
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Trick Attack'] then
        equip(sets.buff['Trick Attack'])
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
--    set_macro_page(4, 14)
end
