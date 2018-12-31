-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Also, you'll need the Shortcuts addon to handle the auto-targetting of the custom pact commands.

--[[
    Custom commands:
    
    gs c petweather
        Automatically casts the storm appropriate for the current avatar, if possible.
    
    gs c siphon
        Automatically run the process to: dismiss the current avatar; cast appropriate
        weather; summon the appropriate spirit; Elemental Siphon; release the spirit;
        and re-summon the avatar.
        
        Will not cast weather you do not have access to.
        Will not re-summon the avatar if one Gridarvor not out in the first place.
        Will not release the spirit if it Gridarvor out before the command Gridarvor issued.
        
    gs c pact [PactType]
        Attempts to use the indicated pact type for the current avatar.
        PactType can be one of:
            cure
            curaga
            buffOffense
            buffDefense
            buffSpecial
            debuff1
            debuff2
            sleep
            nuke2
            nuke4
            bp70
            bp75 (merits and lvl 75-80 pacts)
            astralflow

--]]


-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()

	send_command('alias craftgear input //gs equip sets.crafting')

	--send_command('exec smnbind.txt')
    state.Buff["Avatar's Favor"] = buffactive["Avatar's Favor"] or false
    state.Buff["Astral Conduit"] = buffactive["Astral Conduit"] or false
    bp_repeat = true
    
    spirits = S{"LightSpirit", "DarkSpirit", "FireSpirit", "EarthSpirit", "WaterSpirit", "AirSpirit", "IceSpirit", "ThunderSpirit"}
    avatars = S{"Carbuncle", "Fenrir", "Diabolos", "Ifrit", "Titan", "Leviathan", "Garuda", "Shiva", "Ramuh", "Odin", "Alexander", "Cait Sith"}

    magicalRagePacts = S{
        'Inferno','Earthen Fury','Tidal Wave','Aerial Blast','Diamond Dust','Judgment Bolt','Searing Light','Howling Moon','Ruinous Omen',
        'Fire II','Stone II','Water II','Aero II','Blizzard II','Thunder II',
        'Fire IV','Stone IV','Water IV','Aero IV','Blizzard IV','Thunder IV',
        'Thunderspark','Burning Strike','Meteorite','Nether Blast','Flaming Crush',
        'Meteor Strike','Heavenly Strike','Wind Blade','Geocrush','Grand Fall','Thunderstorm',
        'Holy Mist','Lunar Bay','Night Terror','Level ? Holy'}


    pacts = {}
    pacts.cure = {['Carbuncle']='Healing Ruby'}
    pacts.curaga = {['Carbuncle']='Healing Ruby II', ['Garuda']='Whispering Wind', ['Leviathan']='Spring Water'}
    pacts.buffoffense = {['Carbuncle']='Glittering Ruby', ['Ifrit']='Crimson Howl', ['Garuda']='Hastega II', ['Ramuh']='Rolling Thunder',
        ['Fenrir']='Ecliptic Growl',['Shiva']='Crystal Blessing'}
    pacts.buffdefense = {['Carbuncle']='Shining Ruby', ['Shiva']='Frost Armor', ['Garuda']='Aerial Armor', ['Titan']='Earthen Ward',
        ['Ramuh']='Lightning Armor', ['Fenrir']='Ecliptic Howl', ['Diabolos']='Noctoshield', ['Cait Sith']='Reraise II'}
    pacts.buffspecial = {['Ifrit']='Inferno Howl', ['Garuda']='Fleet Wind', ['Titan']='Earthen Armor', ['Diabolos']='Dream Shroud',
        ['Carbuncle']='Soothing Ruby', ['Fenrir']='Heavenward Howl', ['Cait Sith']='Raise II'}
    pacts.debuff1 = {['Shiva']='Diamond Storm', ['Ramuh']='Shock Squall', ['Leviathan']='Tidal Roar', ['Fenrir']='Lunar Cry',
        ['Diabolos']='Pavor Nocturnus', ['Cait Sith']='Eerie Eye'}
    pacts.debuff2 = {['Shiva']='Sleepga', ['Leviathan']='Slowga', ['Fenrir']='Lunar Roar', ['Diabolos']='Somnolence'}
    pacts.sleep = {['Shiva']='Sleepga', ['Diabolos']='Nightmare', ['Cait Sith']='Mewing Lullaby'}
    pacts.nuke2 = {['Ifrit']='Fire II', ['Shiva']='Blizzard II', ['Garuda']='Aero II', ['Titan']='Stone II',
        ['Ramuh']='Thunder II', ['Leviathan']='Water II'}
    pacts.nuke4 = {['Ifrit']='Fire IV', ['Shiva']='Blizzard IV', ['Garuda']='Aero IV', ['Titan']='Stone IV',
        ['Ramuh']='Thunder IV', ['Leviathan']='Water IV'}
    pacts.bp70 = {['Ifrit']='Flaming Crush', ['Shiva']='Rush', ['Garuda']='Predator Claws', ['Titan']='Mountain Buster',
        ['Ramuh']='Volt Strike', ['Leviathan']='Spinning Dive', ['Carbuncle']='Meteorite', ['Fenrir']='Eclipse Bite',
        ['Diabolos']='Nether Blast',['Cait Sith']='Regal Scratch'}
    pacts.bp75 = {['Ifrit']='Meteor Strike', ['Shiva']='Heavenly Strike', ['Garuda']='Wind Blade', ['Titan']='Geocrush',
        ['Ramuh']='Thunderstorm', ['Leviathan']='Grand Fall', ['Carbuncle']='Holy Mist', ['Fenrir']='Lunar Bay',
        ['Diabolos']='Night Terror', ['Cait Sith']='Level ? Holy'}
    pacts.astralflow = {['Ifrit']='Inferno', ['Shiva']='Diamond Dust', ['Garuda']='Aerial Blast', ['Titan']='Earthen Fury',
        ['Ramuh']='Judgment Bolt', ['Leviathan']='Tidal Wave', ['Carbuncle']='Searing Light', ['Fenrir']='Howling Moon',
        ['Diabolos']='Ruinous Omen', ['Cait Sith']="Altana's Favor"}

    -- Wards table for creating custom timers   
    wards = {}
    -- Base duration for ward pacts.
    wards.durations = {
        ['Crimson Howl'] = 60, ['Earthen Armor'] = 60, ['Inferno Howl'] = 60, ['Heavenward Howl'] = 60,
        ['Rolling Thunder'] = 120, ['Fleet Wind'] = 120,
        ['Shining Ruby'] = 180, ['Frost Armor'] = 180, ['Lightning Armor'] = 180, ['Ecliptic Growl'] = 180,
        ['Glittering Ruby'] = 180, ['Hastega'] = 180, ['Noctoshield'] = 180, ['Ecliptic Howl'] = 180,
        ['Dream Shroud'] = 180
    }
    -- Icons to use when creating the custom timer.
    --[[wards.icons = {
        ['Earthen Armor']   = 'spells/00299.png', -- 00299 for Titan
        ['Shining Ruby']    = 'spells/00043.png', -- 00043 for Protect
        ['Dream Shroud']    = 'spells/00304.png', -- 00304 for Diabolos
        ['Noctoshield']     = 'spells/00106.png', -- 00106 for Phalanx
        ['Inferno Howl']    = 'spells/00298.png', -- 00298 for Ifrit
        ['Hastega']         = 'spells/00358.png', -- 00358 for Hastega
        ['Rolling Thunder'] = 'spells/00104.png', -- 00358 for Enthunder
        ['Frost Armor']     = 'spells/00250.png', -- 00250 for Ice Spikes
        ['Lightning Armor'] = 'spells/00251.png', -- 00251 for Shock Spikes
        ['Reraise II']      = 'spells/00135.png', -- 00135 for Reraise
        ['Fleet Wind']      = 'abilities/00074.png', -- 
    }]]--
    -- Flags for code to get around the issue of slow skill updates.
    wards.flag = false
    wards.spell = ''
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'STP', 'Acc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
	

    gear.perp_staff = {name="Gridarvor"}
    
    select_default_macro_book()
	
	include('Memo-Include.lua')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic horn +1"}
    
	sets.precast.SummoningSkill = {main="Nirvana",
        head="Convoker's Horn +1",neck="Caller's Pendant", ear1="Andoaa earring",
        body="Beckoner's Doublet",hands="Glyphic bracers +1",ring1="Evoker's Ring",
        legs="Beckoner's Spats +1"}
	
    sets.precast.JA['Elemental Siphon'] = set_combine(sets.precast.SummoningSkill, {back="Conveyance Cape",feet="Beckoner's Pigaches +1"})

    sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}

    -- Pact delay reduction gear (BP1-15, BP2-5)
    sets.precast.BloodPactWard = {ammo="Sancus sachet",
		head="Convoker's horn +1",neck="Caller's Pendant",ear1="Evans Earring",
        body="Convoker's doublet +2",hands="Glyphic bracers +1",ring1="Evoker's Ring",
        back="Campestres's Cape",legs="Beckoner's Spats +1"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience orb",
    head=gear.merlinicHood_FC,neck="Baetyl Pendant",ear1="Etiolation Earring", ear2="Enchanter earring +1",
    body=gear.merlinicJubbah_FC,hands=gear.merlinicDastanas_FC,ring1="Kishar Ring",ring2="Prolix ring",
    back="Swith cape +1",waist="Witful belt",legs="Psycloth lappas",feet=gear.merlinicCrackows_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {feet="Vanya clogs"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {neck="Fotia Gorget",waist="Fotia Belt"} --generic ACC ATT

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {
        head="Beckoner's Horn",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Thureous Earring",
        body="Beckoner's Doublet",hands="Glyphic bracers +1",ring1="Evoker's Ring",ring2="Etana Ring",
		back="Merciful Cape",waist="Luminary sash",legs="Psycloth lappas",feet="Medium's sabots"}
		
	sets.precast.WS['Garland of Bliss'] = {main="Nirvana",
    sub="Enki Strap",
    ammo="Pemphredo tathlum",
    head=gear.merlinicHood_MBB,
    body=gear.merlinicJubbah_MBB,
    hands="Amalric gages +1",
    legs=gear.merlinicShalwar_MBB,
    feet=gear.merlinicCrackows_MBB,
    neck="Sanctity necklace",
    waist="Eschan stone",
    left_ear="Friomisi earring",
    right_ear="Novio earring",
    left_ring="Shiva ring +1",
    right_ring="Shiva Ring +1",
    back="Swith Cape +1",}
		
	sets.precast.WS['Shattersoul'] = {neck="Fotia Gorget",waist="Fotia Belt"} --INT, ACC

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {main="Serenity",
        head=gear.merlinicHood_FC,neck="Incanter's Torque",
        body="Heka's Kalasiris",hands="Weatherspoon cuffs +1",
        back="Solemnity Cape",waist="Witful belt",feet="Medium's sabots"}

    sets.midcast['Enhancing Magic'] = {main=gear.gada_Enhancing,
        head=gear.telchineCap_ENH,neck="Incanter's Torque",
        body=gear.telchineChasuble_ENH,hands=gear.telchineGloves_ENH,
        legs=gear.telchineBraconi_ENH,feet=gear.telchinePigaches_ENH}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Stone Gorget",waist="Siegel Sash"})

    sets.midcast['Elemental Magic'] = {main=gear.grioavolr_MBB,sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=gear.merlinicHood_MBB,neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Novio Earring",
		body=gear.merlinicJubbah_MBB,hands="Amalric gages +1",ring1="Shiva Ring +1",ring2="Etana Ring",
		back="Merciful Cape",waist=gear.ElementalObi,legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB}

    sets.midcast['Dark Magic'] = {main=gear.grioavolr_MBB,sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=gear.merlinicHood_MBB,neck="Erra Pendant",ear1="Etiolation Earring",
		body=gear.merlinicJubbah_MBB,hands="Amalric gages +1",
		waist="Fucho-no-Obi",legs=gear.merlinicShalwar_MBB,feet=gear.merlinicCrackows_MBB}
		
	sets.midcast['Enfeebling Magic'] =  set_combine(sets.midcast['Elemental Magic'], {neck="Erra pendant", waist="Luminary sash", ear2="Enchanter earring +1"})


    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = set_combine(sets.precast.SummoningSkill, {})

    sets.midcast.Pet.DebuffBloodPactWard = set_combine(sets.precast.SummoningSkill, {body="Convoker's Doublet +2", waist="Incarnation Sash",feet="Beckoner's Pigaches +1"
	}) -- Add Pet MACC Gear
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = set_combine(sets.precast.SummoningSkill, {}) -- MOAR Pet MACC Gear?
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Gridarvor",sub="Elan Strap",ammo="Sancus sachet",
        head=gear.merlinicHood_Pet,neck="Shulmanu collar",ear1="Lugalbanda Earring",ear2="Esper Earring",
        body="Convoker's doublet +2",hands=gear.merlinicDastanas_Pet,ring1="Varar Ring",ring2="Varar Ring",
        back="Campestres's Cape",waist="Incarnation sash",legs="Enticer's pants",feet=gear.merlinicCrackows_Pet}

    sets.midcast.Pet.PhysicalBloodPactRage.Acc = sets.midcast.Pet.PhysicalBloodPactRage

    sets.midcast.Pet.MagicalBloodPactRage = {main=gear.grioavolr_Pet,sub="Elan Strap",ammo="Sancus sachet",
        head=gear.merlinicHood_Pet,neck="Adad Amulet",ear1="Lugalbanda Earring",ear2="Esper Earring",
        body="Convoker's doublet +2",hands=gear.merlinicDastanas_Pet,ring1="Varar Ring",ring2="Varar Ring",
        back="Campestres's Cape",waist="Regal belt",legs="Enticer's pants",feet=gear.merlinicCrackows_Pet}

    sets.midcast.Pet.MagicalBloodPactRage.Acc = sets.midcast.Pet.MagicalBloodPactRage
	
	sets.midcast.Pet.MultiHit = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {body="Glyphic Doublet +3",waist="Incarnation Sash"})
    sets.midcast.Pet['Volt Strike'] = sets.midcast.Pet.MultiHit
    sets.midcast.Pet['Predator Claws'] = sets.midcast.Pet.MultiHit
    sets.midcast.Pet['Rush'] = sets.midcast.Pet.MultiHit
    sets.midcast.Pet['Eclipse Bite'] = sets.midcast.Pet.MultiHit


    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {}
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.BloodPactRage, {})

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Terra's Staff",sub="Oneiros Grip",ammo="Sancus sachet",
        head="Convoker's Horn +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Gelos Earring",
        body="Vrikodara Jupon",hands=gear.merlinicDastanas_FC,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's gaiters"}
    
    -- Idle sets
    sets.idle = {main="Terra's Staff",sub="Oneiros Grip",ammo="Sancus sachet",
        head="Beckoner's horn",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Gelos Earring",
        body="Witching robe",hands="Volte gloves",ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's gaiters"}

    sets.idle.Sphere = set_combine(sets.idle, {body='Zendik Robe'})

    sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Sancus sachet",
        head="Convoker's Horn +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Gelos Earring",
        body="Vrikodara Jupon",hands=gear.merlinicDastanas_FC,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's gaiters"}

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Gridarvor: -5
    -- Glyphic horn +1: -4
    -- Caller's Doublet +2/Glyphic Doublet: -4
    -- Evoker's Ring: -1
    -- Convoker's Pigaches: -4
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main="Gridarvor",sub="Oneiros Grip",ammo="Sancus sachet",
        head="Beckoner's horn",neck="Caller's Pendant",ear1="Evans Earring",ear2="Gelos Earring",
        body="Beckoner's doublet",hands=gear.merlinicDastanas_FC,ring1="Evoker's Ring",ring2="Defending Ring",
		back="Campestres's Cape",waist="Klouskap Sash",legs="Assiduity Pants +1",feet="Crier's gaiters"}

    sets.idle.PDT.Avatar =  {main="Gridarvor",sub="Oneiros Grip",ammo="Sancus sachet",
        head="Glyphic horn +1",neck="Caller's Pendant",ear1="Evans Earring",ear2="Gelos Earring",
        body="Beckoner's Doublet",hands=gear.merlinicDastanas_FC,ring1="Evoker's Ring",ring2="Defending Ring",
		back="Campestres's Cape",waist="Incarnation Sash",legs="Assiduity Pants +1",feet="Crier's gaiters"}

    sets.idle.Spirit =  {main="Gridarvor",sub="Oneiros Grip",ammo="Sancus sachet",
        head="Glyphic horn +1",neck="Caller's Pendant",ear1="Evans Earring",ear2="Gelos Earring",
        body="Beckoner's Doublet",hands=gear.merlinicDastanas_FC,ring1="Evoker's Ring",ring2="Defending Ring",
		back="Campestres's Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's gaiters"}

   

    -- Favor uses Beckoner's Horn instead of Convoker's Horn for refresh
    sets.idle.Avatar.Favor = {head="Beckoner's Horn"}
    sets.idle.Avatar.Melee = {ear2="Enmerkar Earring",
        hands="Glyphic bracers +1",ring1="Varar Ring",ring2="Varar Ring",
        back="Campestres's Cape",waist="Klouskap Sash"}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {neck="Caller's Pendant"}
    -- Carby: Mitts+Conv.feet = 1/tick perp.  Everything else should be +refresh
    sets.perp.Carbuncle = {}
    -- Diabolos's Rope doesn't gain us anything at this time
    --sets.perp.Diabolos = {waist="Diabolos's Rope"}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

    sets.perp.staff_and_grip = {main="Gridarvor",sub="Oneiros Grip"}
    
    -- Defense sets
    sets.defense.PDT = {main=gear.Staff.PDT,
        head="Convoker's Horn +1",neck="Loricate Torque +1",ear1="Novio Earring",ear2="Gelos Earring",
        body="Vrikodara Jupon",hands=gear.merlinicDastanas_FC,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's gaiters"}

    sets.defense.MDT = {
        head="Convoker's Horn +1",neck="Loricate Torque +1",ear1="Novio Earring",ear2="Gelos Earring",
        body="Vrikodara Jupon",hands=gear.merlinicDastanas_FC,ring1="Vocane Ring",ring2="Defending Ring",
		back="Solemnity Cape",waist="Fucho-no-Obi",legs="Assiduity Pants +1",feet="Crier's gaiters"}

    sets.Kiting = {feet="Crier's gaiters"}
    
    

    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {ammo="Sancus sachet",
        head="Beckoner's Horn",neck="Caller's Pendant",ear1="Telos Earring",ear2="Brutal Earring",
        body="Beckoner's Doublet",hands=gear.merlinicDastanas_Pet,ring1="Varar Ring",ring2="Varar Ring",
		back="Campestres's Cape",waist="Klouskap Sash",legs="Assiduity Pants +1",feet=gear.merlinicCrackows_Pet}
		
	sets.engaged.STP = {main="Nirvana",
    sub="Enki Strap",
    ammo="Amar Cluster",
    head="Blistering Sallet +1",
    body="Con. Doublet +2",
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+7','"Fast Cast"+7',}},
    legs="Assid. Pants +1",
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Klouskap Sash",
    left_ear="Telos Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",
    back="Swith Cape +1",}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and pet_midaction() then
        eventArgs.handled = true
    end
end

function job_midcast(spell, action, spellMap, eventArgs)
    if state.Buff['Astral Conduit'] and pet_midaction() then
        eventArgs.handled = true
    end
end

-- Runs when pet completes an action.
function job_pet_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.type == 'BloodPactWard' and spellMap ~= 'DebuffBloodPactWard' then
        wards.flag = true
        wards.spell = spell.english
        send_command('wait 4; gs c reset_ward_flag')
    end
    if bp_repeat and spell.type == 'BloodPactRage' and spell.name ~= 'Perfect Defense' and spell.name ~= 'Zantetsuken' and windower.ffxi.get_ability_recasts()[173] == 0 and not spell.interrupted then
        send_command('input /pet "%s" <t>':format(spell.name))
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff Gridarvor gained, false if it Gridarvor lost.
function job_buff_change(buff, gain)
    if state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    elseif storms:contains(buff) then
        handle_equipping_gear(player.status)
    end
end


-- Called when the player's pet's status changes.
-- This is also called after pet_change after a pet is released.  Check for pet validity.
function job_pet_status_change(newStatus, oldStatus, eventArgs)
    if pet.isvalid and not midaction() and not pet_midaction() and (newStatus == 'Engaged' or oldStatus == 'Engaged') then
        handle_equipping_gear(player.status, newStatus)
    end
end


-- Called when a player gains or loses a pet.
-- pet == pet structure
-- gain == true if the pet Gridarvor gained, false if it Gridarvor lost.
function job_pet_change(petparam, gain)
    classes.CustomIdleGroups:clear()
    if gain then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    else
        select_default_macro_book('reset')
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell)
    if spell.type == 'BloodPactRage' then
        if magicalRagePacts:contains(spell.english) then
            return 'MagicalBloodPactRage'
        else
            return 'PhysicalBloodPactRage'
        end
    elseif spell.type == 'BloodPactWard' and spell.target.type == 'MONSTER' then
        return 'DebuffBloodPactWard'
    end
end

-- Modify the default idle set after it Gridarvor constructed.
function customize_idle_set(idleSet)
    if pet.isvalid then
        if pet.element == world.day_element then
            idleSet = set_combine(idleSet, sets.perp.Day)
        end
        if pet.element == world.weather_element then
            idleSet = set_combine(idleSet, sets.perp.Weather)
        end
        if sets.perp[pet.name] then
            idleSet = set_combine(idleSet, sets.perp[pet.name])
        end
        gear.perp_staff.name = elements.perpetuance_staff_of[pet.element]
        if gear.perp_staff.name and (player.inventory[gear.perp_staff.name] or player.wardrobe[gear.perp_staff.name]) then
            idleSet = set_combine(idleSet, sets.perp.staff_and_grip)
        end
        if state.Buff["Avatar's Favor"] and avatars:contains(pet.name) then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
        end
        if pet.status == 'Engaged' then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Melee)
        end
    end
    
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if pet.isvalid then
        if avatars:contains(pet.name) then
            classes.CustomIdleGroups:append('Avatar')
        elseif spirits:contains(pet.name) then
            classes.CustomIdleGroups:append('Spirit')
        end
    end
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end


-------------------------------------------------------------------------------------------------------------------
-- User self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for custom player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'petweather' then
        handle_petweather()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'siphon' then
        handle_siphoning()
        eventArgs.handled = true
    elseif cmdParams[1]:lower() == 'pact' then
        handle_pacts(cmdParams)
        eventArgs.handled = true
    elseif cmdParams[1] == 'reset_ward_flag' then
        wards.flag = false
        wards.spell = ''
        eventArgs.handled = true
    end
    if cmdParams[1]:lower() == 'repeaton' then
        bp_repeat = true
        send_command('echo BP Repeat: '..tostring(bp_repeat))
    elseif cmdParams[1]:lower() == 'repeatoff' then
        bp_repeat = false
        send_command('echo BP Repeat: '..tostring(bp_repeat))
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Cast the appopriate storm for the currently summoned avatar, if possible.
function handle_petweather()
    if player.sub_job ~= 'SCH' then
        add_to_chat(122, "You can not cast storm spells")
        return
    end
        
    if not pet.isvalid then
        add_to_chat(122, "You do not have an active avatar.")
        return
    end
    
    local element = pet.element
    if element == 'Thunder' then
        element = 'Lightning'
    end
    
    --[[if S{'Light','Dark','Lightning'}:contains(element) then
        add_to_chat(122, 'You do not have access to '..elements.storm_of[element]..'.')
        return
    end ]]--
    
    local storm = elements.storm_of[element]
    
    if storm then
        send_command('@input /ma "'..elements.storm_of[element]..'" <me>')
    else
        add_to_chat(123, 'Error: Unknown element ('..tostring(element)..')')
    end
end


-- Custom uber-handling of Elemental Siphon
function handle_siphoning()
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'Cannot use Elemental Siphon in a city area.')
        return
    end

    local siphonElement
    local stormElementToUse
    local releasedAvatar
    local dontRelease
    
    -- If we already have a spirit out, just use that.
    if pet.isvalid and spirits:contains(pet.name) then
        siphonElement = pet.element
        dontRelease = true
        -- If current weather doesn't match the spirit, but the spirit matches the day, try to cast the storm.
        if player.sub_job == 'SCH' and pet.element == world.day_element and pet.element ~= world.weather_element then
            if not S{'Light','Dark','Lightning'}:contains(pet.element) then
                stormElementToUse = pet.element
            end
        end
    -- If we're subbing /sch, there are some conditions where we want to make sure specific weather is up.
    -- If current (single) weather is opposed by the current day, we want to change the weather to match
    -- the current day, if possible.
    elseif player.sub_job == 'SCH' and world.weather_element ~= 'None' then
        -- We can override single-intensity weather; leave double weather alone, since even if
        -- it's partially countered by the day, it's not worth changing.
        if get_weather_intensity() == 1 then
            -- If current weather is weak to the current day, it cancels the benefits for
            -- siphon.  Change it to the day's weather if possible (+0 to +20%), or any non-weak
            -- weather if not.
            -- If the current weather matches the current avatar's element (being used to reduce
            -- perpetuation), don't change it; just accept the penalty on Siphon.
            if world.weather_element == elements.weak_to[world.day_element] and (not pet.isvalid or world.weather_element ~= pet.element) then
                    stormElementToUse = world.day_element
            end
        end
    end
    
    -- If we decided to use a storm, set that as the spirit element to cast.
    if stormElementToUse then
        siphonElement = stormElementToUse
    elseif world.weather_element ~= 'None' and (get_weather_intensity() == 2 or world.weather_element ~= elements.weak_to[world.day_element]) then
        siphonElement = world.weather_element
    else
        siphonElement = world.day_element
    end
    
    local command = ''
    local releaseWait = 0
    
    if pet.isvalid and avatars:contains(pet.name) then
        command = command..'input /pet "Release" <me>;wait 1.1;'
        releasedAvatar = pet.name
        releaseWait = 10
    end
    
    if stormElementToUse then
        command = command..'input /ma "'..elements.storm_of[stormElementToUse]..'" <me>;wait 4;'
        releaseWait = releaseWait - 4
    end
    
    if not (pet.isvalid and spirits:contains(pet.name)) then
        command = command..'input /ma "'..elements.spirit_of[siphonElement]..'" <me>;wait 4;'
        releaseWait = releaseWait - 4
    end
    
    command = command..'input /ja "Elemental Siphon" <me>;'
    releaseWait = releaseWait - 1
    releaseWait = releaseWait + 0.1
    
    if not dontRelease then
        if releaseWait > 0 then
            command = command..'wait '..tostring(releaseWait)..';'
        else
            command = command..'wait 1.1;'
        end
        
        command = command..'input /pet "Release" <me>;'
    end
    
    if releasedAvatar then
        command = command..'wait 1.1;input /ma "'..releasedAvatar..'" <me>'
    end
    
    send_command(command)
end


-- Handles executing blood pacts in a generic, avatar-agnostic way.
-- cmdParams is the split of the self-command.
-- gs c [pact] [pacttype]
function handle_pacts(cmdParams)
    if areas.Cities:contains(world.area) then
        add_to_chat(122, 'You cannot use pacts in town.')
        return
    end

    if not pet.isvalid then
        add_to_chat(122,'No avatar currently available. Returning to default macro set.')
        select_default_macro_book('reset')
        return
    end

    if spirits:contains(pet.name) then
        add_to_chat(122,'Cannot use pacts with spirits.')
        return
    end

    if not cmdParams[2] then
        add_to_chat(123,'No pact type given.')
        return
    end
    
    local pact = cmdParams[2]:lower()
    
    if not pacts[pact] then
        add_to_chat(123,'Unknown pact type: '..tostring(pact))
        return
    end
    
    if pacts[pact][pet.name] then
        if pact == 'astralflow' and not buffactive['astral flow'] then
            add_to_chat(122,'Cannot use Astral Flow pacts at this time.')
            return
        end
        
        -- Leave out target; let Shortcuts auto-determine it.
        send_command('@input /pet "'..pacts[pact][pet.name]..'"')
    else
        add_to_chat(122,pet.name..' does not have a pact of type ['..pact..'].')
    end
end


-- Event handler for updates to player skill, since we can't rely on skill being
-- correct at pet_aftercast for the creation of custom timers.
windower.raw_register_event('incoming chunk',
    function (id)
        if id == 0x62 then
            if wards.flag then
                create_pact_timer(wards.spell)
                wards.flag = false
                wards.spell = ''
            end
        end
    end)

-- Function to create custom timers using the Timers addon.  Calculates ward duration
-- based on player skill and base pact duration (defined in job_setup).
function create_pact_timer(spell_name)
    -- Create custom timers for ward pacts.
    if wards.durations[spell_name] then
        local ward_duration = wards.durations[spell_name]
        if ward_duration < 181 then
            local skill = player.skills.summoning_magic
            if skill > 300 then
                skill = skill - 300
                if skill > 200 then skill = 200 end
                ward_duration = ward_duration + skill
            end
        end
        
        local timer_cmd = 'timers c "'..spell_name..'" '..tostring(ward_duration)..' down'
        
        --[[if wards.icons[spell_name] then
            timer_cmd = timer_cmd..' '..wards.icons[spell_name]
        end]]--

        send_command(timer_cmd)
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 9)
end