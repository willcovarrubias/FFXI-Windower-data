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

	include('Alaza-Include.lua')
	include('Asellus-Include.lua')
    state.Buff['Sneak Attack'] = buffactive['Sneak Attack'] or false
    state.Buff['Trick Attack'] = buffactive['Trick Attack'] or false

send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma Apururu (UC)" <me>; wait 7; input /ma "AAGK" <me>; wait 7; input /ma "Selh\'teus" <me>; wait 7; input /ma "Mihli Aliapoh" <me>;' )
--send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "AAGK" <me>; wait 7; input /ma "AAMR" <me>; wait 7; input /ma "Koru-Moru" <me>;' )
send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

send_command('alias vw input /item "Stalwart\'s tonic" <me>; wait 3; input /item "Monarch\'s drink" <me>; wait 3; input /item "Braver\'s drink" <me>; wait 3; input /item "Fanatic\'s drink" <me>;')
send_command('alias cel input /item "Rubicund Cell" <t>; ')
send_command('alias dis input /item "Phase Displacer" <t>; ')
send_command('alias atk input /attack <bt>; ')
send_command('alias echo input /item "Echo Drops" <me>; ')
send_command('alias holy input /item "Holy Water" <me>; ')
send_command('alias rem input /item "Remedy" <me>; ')

end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'TH', 'Acc', 'PDT')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	
	send_command('bind @1 input /ja "haste Samba" <me>')
	send_command('bind @2 input /ja "Drain Samba III" <me>')
	send_command('bind @3 input /ja "Aspir Samba III" <me>')
	send_command('bind @4 input /ja "feint" <me>')
	send_command('bind @5 input /ma "Cure V" <t>')
	send_command('bind @6 input /ma "Cure VI" <t>')
	send_command('bind @7 input /ja "Shield Bash" <t>')
	send_command('bind @8 input /ma "Regen IV" <t>')
	send_command('bind @9 input //exec thf/SA_Rudra.txt')
	send_command('bind @0 input //exec thf/SA_Mandalic.txt')
	send_command('bind @- input /ma "Devotion" <t>')
	send_command('bind @= input /ja "Divine Seal" <me>')

-- Misc CTRL	
	send_command('bind ^1 input /ra <t>')
	send_command('bind ^2 input /ja "Puppet Roll" <me>')
	send_command('bind ^3 input /ja "Beast Roll" <me>')
	send_command('bind ^4 input /ja "aggressor" <me>')
	send_command('bind ^5 input /ma "Chocobo mazurka" <me>')
	send_command('bind ^6 input /ma "Cure VI" <t>')
	send_command('bind ^7 input /ja "Shield Bash" <t>')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input /ja "spectral jig" <me>')
	send_command('bind ^0 input //exec thf/SA_Mandalic.txt')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ja "Crooked Cards" <me>')
	send_command('bind !2 input /ja "Double-Up" <me>')
	send_command('bind !3 input /ja "Snake Eye" <me> ')
	send_command('bind !4 input /ja "warcry" <me>')
	send_command('bind !5 input /ja "warcry" <me>')
	send_command('bind !6 input /ja "no foot rise" <me>')
	send_command('bind !7 input /ja "presto" <me>')
	send_command('bind !8 input /ja "contradance" <me>')
	send_command('bind !9 input /ja "chocobo jig II" <me>')
	send_command('bind !0 input //exec thf/TA_Mandalic.txt')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != input //gs c cycle OffenseMode')
	
-- 	Buffs CTRL

	send_command('bind @F1 input /ja "flee" <me>')
	send_command('bind @F2 input /ja "sneak attack" <me>')
	send_command('bind @F3 input /ja "trick attack" <me>')
	send_command('bind @F4 input /ma "Dispel" <t>')
	send_command('bind @F5 input /ma "Dia II" <t>')
	send_command('bind @F6 input /ma "Slow" <t>')
	send_command('bind @F7 input /ma "Paralyze" <t>')
	send_command('bind @F8 input /ma "Addle" <t>')
	send_command('bind @F9 input /ma "Silence" <t>')
	send_command('bind @F10 input /ma "Holy II" <t>')
	send_command('bind @F11 input /ma "Banish III" <t>')
	send_command('bind @F12 input /ja "Accession" <me>; input /echo --AOE--')

	send_command('bind ^F1 input /ja "quickstep" <t>')
	send_command('bind ^F2 input /ja "box step" <t>')
	send_command('bind ^F3 input /ja "Stutter Step" <t>')
	send_command('bind ^F4 input /ja "feather step" <t>')
	send_command('bind ^F5 input /ja "animated flourish" <t>')
	send_command('bind ^F6 input /ja "no foot rise" <me>')
	send_command('bind ^F7 input /ja "steal" <t>')
	send_command('bind ^F8 input /ja "despoil" <t>')
	send_command('bind ^F9 input /ja "bully" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input /ma "Banish III" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE--')
	
	send_command('bind !F1 input /ja "Curing Waltz" <stpc>')
	send_command('bind !F2 input /ja "Curing Waltz II" <stpc>')
	send_command('bind !F3 input /ja "Curing Waltz III" <stpc>')
	send_command('bind !F4 input /ja "Curing Waltz IV" <stpc>')
	send_command('bind !F5 input /ja "Curing Waltz V" <stpc>')
	send_command('bind !F6 input /ja "Healing Waltz" <stpc>')
	send_command('bind !F7 input /ja "Divine Waltz" <me>')
	send_command('bind !F8 input /ja "Divine Waltz II"  <me>')
	send_command('bind !F9 input /ma "Silence" <t>')
	send_command('bind !F10 input /ma "Holy II" <t>')
	send_command('bind !F11 input /ma "Banish III" <t>')
	send_command('bind !F12 input /ja "Accession" <me>; input /echo --AOE--')



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

    sets.precast.WS['Rudra\'s Storm'] = {
        head="Sulevia\'s mask",
		neck="Fotia Gorget",
		ear1="ishvara earring",
		ear2="Dominance Earring +1",
        body="Souveran Cuirass",
		hands="Sulevia's gauntlets",
		ring1="Apate Ring",
		ring2="Pyrosoul Ring",
        back="Cerb. Mantle +1",
		waist="Fotia Belt",
		legs="Sulvia's Cuisses",
		feet="Sulevia's Leggings"
	}
		
	sets.precast.WS['Evisceration'] = {
		neck="Fotia Gorget",
		ear1="ishvara earring",
		ear2="Hecate's Earring",
		ring1="Apate Ring",
		ring2="Acumen Ring",
		waist="Fotia Belt"
		}
	
	sets.precast.WS['Exenterator'] = {
		neck="Fotia Gorget",
		ear1="ishvara earring",
		ear2="Hecate's Earring",
		ring1="Apate Ring",
		ring2="Acumen Ring",
		waist="Fotia Belt"
		}
	
	sets.precast.WS['Pyrrhic Kleos'] = {
		neck="Fotia Gorget",
		ear1="ishvara earring",
		ear2="Hecate's Earring",
		ring1="Apate Ring",
		ring2="Acumen Ring",
		waist="Fotia Belt"
		}
		
	sets.precast.WS['shark bite'] = {
		neck="Fotia Gorget",
		ear1="ishvara earring",
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
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Creed Earring",
        body="Souveran Cuirass",
		hands="Sulevia's gauntlets",
		ring1="Defending ring",
		ring2="warden's Ring",
        back="Atheling mantle",
		back="Mecistopins mantle",
		waist="Nierenschutz",
		legs="Crimson Cuisses +1",
		feet="Tandava Crackows"
    }   

		
    sets.idle.PDT = {
		ammo="Angha Gem",
		head="Sulevia's mask",
		neck="Loricate Torque +1",
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
		neck="Loricate Torque +1",
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
        --head="Gendewitha Caubeen",neck="Loricate Torque +1",
        --body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        --back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        --head="Nahtirah Hat",neck="Loricate Torque +1",
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
    sets.engaged.Normal = { 
		ammo="ginsen",
		ammo="Yamarang",
        head="Dampening Tam",
		neck="Asperity necklace",
		neck="sanctity necklace",
		neck="anu torque",
		ear1="cessance earring",
		ear2="sherida earring",
        body=gear.herculeanVest_TP,
		hands="Adhemar wristbands",
		ring1="hetairoi ring",
		ring1="Rajas ring",
		ring2="Epona's ring",
		ring2="ilabrat ring",
        back="senuna's mantle",
		waist="Windbuffet belt +1",
		legs=gear.herculeanTrousers_TP,
		feet=gear.herculeanBoots_TP
		}
		
    sets.engaged.TH = { 
		ammo="Angha gem",
        head="Sulevia's mask",
		neck="Agasaya's collar",
		ear1="Suppanomimi",
		ear2="Brutal earring",
        body="Meghanada Cuirie",
		hands="Plunderer's armlets",
		ring1="Demonry ring",
		ring2="Epona's Ring",
        back="Canny Cape",
		waist="Sailfi belt +1",
		legs="Meghanada chausses",
		feet="Skulker's poulaines"
	}
		
	sets.engaged.Acc = { 
		ammo="Hasty pinion +1",
        head="Sulevia's mask",
		neck="Peacock charm",
		ear1="Suppanomimi",
		ear2="Brutal Earring",
        body="Souveran cuirass",
		hands="Sulevia's gauntlets",
		ring1="Mars's ring",
		ring2="Apate Ring",
        back="Atheling mantle",
		waist="Sailfi belt +1",
		legs="Sulevia's cuisses",
		feet="Sulevia's leggings"
	}
	
	sets.engaged.PDT = { 
		ammo="Angha gem",
        head="Sulevia's mask",
		neck="Twilight collar",
		ear1="Suppanomimi",
		ear2="Brutal Earring",
        body="Meghanada cuirie",
		hands="Meghanada gloves",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
        back="Canny Cape",
		waist="Phasmida Belt",
		legs="Meghanada chausses",
		feet="Meghanada jambeaux"
	}

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
