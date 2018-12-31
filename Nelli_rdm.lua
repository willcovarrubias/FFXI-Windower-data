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
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT')

    gear.default.obi_waist = "Sekhmet Corset"
    -- 	Buffs ALT
	send_command('bind !F1 input /ma "Barfira" <me>')
	send_command('bind !F2 input /ma "Barwatera" <me>')
	send_command('bind !F3 input /ma "Baraera" <me>')
	send_command('bind !F4 input /ma "Barblizzara" <me>')
	send_command('bind !F5 input /ma "Barthundra" <me>')
	send_command('bind !F6 input /ma "Stun" <t>')
	send_command('bind !F7 input /ma "Arise" <t>')
	send_command('bind !F8 input /ma "Curaga III" <t>')
	send_command('bind !F9 input /ma "Curaga IV" <t>')
	send_command('bind !F10 input /ja "Penury" <me>; /echo --Save Mana--')
	send_command('bind !F11 input /ja "Celerity" <me>; /echo --Fast Casting--')
	send_command('bind !F12 gs c cycle OffenseMode')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Phalanx II" <t>')
	send_command('bind ^F4 input /ma "Dispel" <t>')
	send_command('bind ^F5 input /ma "Dia II" <t>')
	send_command('bind ^F6 input /ma "Slow" <t>')
	send_command('bind ^F7 input /ma "Paralyze" <t>')
	send_command('bind ^F8 input /ma "Addle" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input /ma "Banish III" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE--')
	
-- Debuffs ALT	
	send_command('bind !1 input /ma "Paralyna" <t>')
	send_command('bind !2 input /ma "Silena" <t>')
	send_command('bind !3 input /ma "Blindna" <t>')
	send_command('bind !4 input /ma "Cursna" <t>')
	send_command('bind !5 input /ma "Stona" <t>')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Esuna" <me>')
	send_command('bind !9 input /ma "Sacrifice" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /ma "Flash" <t>')
	send_command('bind ^2 input /ma "Curaga" <t>')
	send_command('bind ^3 input /ma "Cure III" <t>')
	send_command('bind ^4 input /ma "Cure IV" <t>')
	send_command('bind ^5 input /ma "Cure V" <t>')
	send_command('bind ^6 input /ma "Cure VI" <t>')
	send_command('bind ^7 input /ma "Haste II" <t>')
	send_command('bind ^8 input /ma "Regen IV" <t>')
	send_command('bind ^9 input /ma "Repose" <t>')
	send_command('bind ^0 input /ma "Refresh" <t>')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ma "Refresh" <t>')
	
	
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitivation Tabard"}
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="jhakri coronal +1",
        body="Atrophy Tabard +1",hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    -- 80% Fast Cast (including trait) for all spells, plus 5% quick cast
    -- No other FC sets necessary.
    sets.precast.FC = {main="Earth Staff",
    sub="Giuoco Grip",
    ammo="Pemphredo Tathlum",
    head="Atro. Chapeau +1",
    body={ name="Vitivation Tabard", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+6',}},
    legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+16','"Fast Cast"+7',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+2','"Fast Cast"+10',}},
}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Ginsen",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands={ name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Cessance Earring",
    right_ear="Ishvara Earring",
    left_ring="rufescent Ring",
    right_ring="apate Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+2','"Fast Cast"+10',}},
}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, 
        {neck="Soil Gorget",ear1="Brutal Earring",ear2="Moonshade Earring",
        ring1="Aquasoul Ring",ring2="Aquasoul Ring",waist="Soil Belt"})

    sets.precast.WS['Sanguine Blade'] = {ammo="Witchstone",
        head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Acumen Ring",
        back="Toro Cape",legs="Hagondes Pants",feet="Hagondes Sabots"}
		
	sets.precast.WS['Knights of Round'] = {
        back="vespid mantle",}

    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {main="Earth Staff",
    sub="Giuoco Grip",
    ammo="Pemphredo Tathlum",
    head="Atro. Chapeau +1",
    body={ name="Vitivation Tabard", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+6',}},
    legs={ name="Lengo Pants", augments={'INT+5','Mag. Acc.+4','"Mag.Atk.Bns."+1','"Refresh"+1',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+16','"Fast Cast"+7',}},
    neck="Baetyl Pendant",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+2','"Fast Cast"+10',}},
}

    sets.midcast.Cure = {main="Arka IV",sub="pax grip",
        head="vanya hood",neck="noden's gorget",ear1="Roundel Earring",ear2="mendicant's Earring",
        body="vitivation tabard",hands="vanya cuffs",ring1="tamas Ring",ring2="Sirona's Ring",
        back="mahatma cape",waist="penitent's rope",legs="atrophy tights +1",feet="vanya clogs"}
        
    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {ring1="Kunaji Ring",ring2="Asklepian Ring"}

    sets.midcast['Enhancing Magic'] = {main="Earth Staff",
    sub="Giuoco Grip",
    ammo="Pemphredo Tathlum",
    head="Umuthi Hat",
    body={ name="Vitivation Tabard", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Vitivation Gloves", augments={'Enhances "Phalanx II" effect',}},
    legs="Atrophy Tights +1",
    feet="Leth. Houseaux",
    neck="Incanter's Torque",
    waist="Siegel Sash",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Lebeche Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -4%',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+2','"Fast Cast"+10',}},
}

    sets.midcast.Refresh = {legs="lethargy Fuseau +1",back="grapevine cape"}

    sets.midcast.Stoneskin = {waist="Siegel Sash",head="umuthi hat",neck="stone gorget",ear1="earthcry earring"}
    
    sets.midcast['Enfeebling Magic'] = {main={ name="Lehbrailg +2", augments={'DMG:+16','Magic crit. hit rate +5','Enmity-4',}},
    sub="Niobid Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Vitivation Chapeau", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body="Lethargy Sayon",
    hands="Kaykaus Cuffs",
    legs={ name="Psycloth Lappas", augments={'MP+50','Mag. Acc.+9','"Fast Cast"+4',}},
    feet="Jhakri Pigaches +1",
    neck="Incanter's Torque",
    waist="Refoccilation Stone",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Etana Ring",
    right_ring="Vertigo Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+2','"Fast Cast"+10',}},
}

    sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})

    sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {head="Vitivation Chapeau"})
    
    sets.midcast['Elemental Magic'] = {main={ name="Lehbrailg +2", augments={'DMG:+16','Magic crit. hit rate +5','Enmity-4',}},
    sub="Willpower Grip",
    ammo="Pemphredo Tathlum",
    head={ name="Merlinic Hood", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','Magic burst mdg.+10%',}},
    body="Jhakri Robe +1",
    hands={ name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Magic burst mdg.+10%','"Mag.Atk.Bns."+11',}},
    feet={ name="Merlinic Crackows", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst mdg.+8%','Mag. Acc.+13',}},
    neck="Mizu. Kubikazari",
    waist="Refoccilation Stone",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    left_ring="Resonance Ring",
    right_ring="Mujin Band",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},
}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Kalboron Stone",
        head="jhakri coronal +1",neck="incanter's torque",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="psycloth vest",hands="jhakri cuffs +1",ring1="Prolix Ring",ring2="excelsis Ring",
        back="Refraction Cape",waist="Refoccilation Stone",legs="psycloth lappas",feet="jhakri pigaches +1"}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {ring1="Excelsis Ring", waist="Fucho-no-Obi"})

    sets.midcast.Aspir = sets.midcast.Drain


    -- Sets for special buff conditions on spells.

    sets.midcast.EnhancingDuration = {hands="Atrophy Gloves +1",back="Estoqueur's Cape",feet="lethargy Houseaux"}
        
    sets.buff.ComposureOther = {head="lethargy Chappel",
        body="lethargy Sayon",hands="lethargy Gantherots",
        legs="lethargy Fuseau",feet="lethargy Houseaux"}

    sets.buff.Saboteur = {hands="lethargy Gantherots"}
    

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
        head="Vitivation Chapeau",neck="loricate torque +1",
        body="Jhakri robe +1",hands="Serpentes Cuffs",ring1="dark Ring",ring2="Dark Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1"}
    

    -- Idle sets
    sets.idle = {main="earth staff",sub="giuoco grip",ammo="Impatiens",
        head="Vitivation Chapeau",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Jhakri robe +1",hands="atrophy gloves +1",ring1="dark Ring",ring2="shadow Ring",
        back="umbra cape",waist="Flume Belt",legs="carmine Cuisses",feet="atrophy boots +1"}

    sets.idle.Town = {main="earth staff",sub="giuoco grip",ammo="Impatiens",
        head="jhakri coronal +1",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Jhakri robe +1",hands="Atrophy Gloves +1",ring1="dark Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flume Belt",legs="carmine Cuisses",feet="Hagondes Sabots"}
    
    sets.idle.Weak = {main="earth staff",sub="giuoco grip",ammo="Impatiens",
        head="Vitivation Chapeau",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Jhakri robe +1",hands="Serpentes Cuffs",ring1="dark Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flume Belt",legs="carmine Cuisses",feet="Hagondes Sabots"}

    sets.idle.PDT = {main="earth staff",sub="giuoco grip",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Gendewitha Bliaut +1",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Flume Belt",legs="Atrophy tights +1",feet="Gendewitha Galoshes"}

    sets.idle.MDT = {main="earth staff",sub="giuoco grip",ammo="Demonry Stone",
        head="Gendewitha Caubeen +1",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Gendewitha Caubeen +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="atrophy tights +1",feet="Gendewitha Galoshes"}
    
    
    -- Defense sets
    sets.defense.PDT = {
        head="jhakri coronal +1",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Hagondes Coat",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Umbra Cape",waist="Flume Belt",legs="Hagondes Pants",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="jhakri coronal +1",neck="loricate torque +1",ear1="etiolation Earring",ear2="Loquacious Earring",
        body="Jhakri robe +1",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Engulfer Cape",waist="Flume Belt",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="carmine Cuisses"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
        ammo="Ginsen",
    head={ name="Carmine Mask", augments={'Accuracy+15','Mag. Acc.+10','"Fast Cast"+3',}},
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs={ name="Carmine Cuisses", augments={'Accuracy+14','Attack+9','"Dual Wield"+4',}},
    feet="Taeon Boots",
    neck="Lissome Necklace",
    waist="Sailfi Belt +1",
    left_ear="Cessance Earring",
    right_ear="Suppanomimi",
    left_ring="Petrov Ring",
    right_ring="hetairoi Ring",
    back="Relucent Cape"}
		
    sets.engaged.Defense = {
        main="Demers. Degen +1",
		sub="giuoco grip",
		range="Aureole",
		head="Jhakri Coronal +1",
		body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		legs="Jhakri Slops +1",
		feet="Jhakri Pigaches +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Pixie Earring",
		right_ear="Aesir Ear Pendant",
		left_ring="Jupiter's Ring",
		right_ring="Flame Ring",
		back="Ghostfyre Cape"}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
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
    if player.sub_job == 'DNC' then
        set_macro_page(2, 4)
    elseif player.sub_job == 'NIN' then
        set_macro_page(3, 4)
    elseif player.sub_job == 'THF' then
        set_macro_page(4, 4)
    else
        set_macro_page(1, 4)
    end
end

