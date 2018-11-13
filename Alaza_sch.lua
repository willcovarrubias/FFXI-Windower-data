-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------


--[[
        Custom commands:

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false

    state.ChatMode = M{['description']='Calling SleepBreak', 'echo', 'party'}
	
	state.MagicBurst = M(false, 'Magic Burst')
	
    update_active_strategems()
	
	include('Alaza-Include.lua')
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
	
	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	
	send_command('alias fs2 input /ma "firestorm2" <t>')
	send_command('alias ss2 input /ma "sandstorm2" <t>')
	send_command('alias rs2 input /ma "rainstorm2" <t>')
	send_command('alias ts2 input /ma "thunderstorm2" <t>')
	send_command('alias ws2 input /ma "windstorm2" <t>')
	send_command('alias hs2 input /ma "hailstorm2" <t>')
	send_command('alias vs2 input /ma "voidstorm2" <t>')
	send_command('alias as2 input /ma "aurorastorm2" <t>')
	
	send_command('alias gem input /ja "Immanence" <me>')
	
	send_command('alias p5 input /ma "Protect V" <t>')
	send_command('alias s5 input /ma "shell V" <t>')
	send_command('alias ss input /ma "stoneskin" <me>')
	send_command('alias bl input /ma "blink" <me>')
	send_command('alias adl input /ma "adloquium" <t>')
	send_command('alias aqu input /ma "aquaveil" <me>')
	send_command('alias fis input /equip range "halcyon rod";input /equip ammo "Robber Rig";input /equip head "Midras\'s helm +1"; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias grav input //exec sch/gravitation.txt')
	send_command('alias dist input //exec sch/distortion.txt')
	send_command('alias fire input //exec sch/fire.txt')
	send_command('alias ice input //exec sch/ice.txt')
	send_command('alias thun input //exec sch/thun.txt')
	send_command('alias wat input //exec sch/water.txt')
	send_command('alias light input //exec sch/light.txt')
	send_command('alias dark input //exec sch/dark.txt')
	send_command('alias wind input //exec sch/wind.txt')
	send_command('alias stone input //exec sch/stone.txt')
	send_command('alias rem input /item "Remedy" <me>')
	send_command('alias revit input /item "Super Revitalizer" <me>')
	send_command('alias doom input /item "Savior\'s tonic" <me>')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('NormalMP', 'MB', 'MBMP', 'Normal')
    state.IdleMode:options('Normal', 'Sphere', 'PDT', 'Stun')

-- 	Buffs ALT
	send_command('bind !F1 input /ma "Drain" <t>')
	send_command('bind !F2 input /ma "Aspir" <t>')
	send_command('bind !F3 input /ma "Aspir II" <t>')
	send_command('bind !F4 input /ma "Break" <t>')
	send_command('bind !F5 input /ma "Bind" <t>')
	send_command('bind !F6 input /ma "Gravity" <t>')
	send_command('bind !F7 input /ma "Stun" <t>')
	send_command('bind !F8 input /ma "Sleep" <t>')
	send_command('bind !F9 input /ma "Sleep II" <t>')
	send_command('bind !F10 input /ja "Manifestation" <me>; /echo --AOE Dark--')
	send_command('bind !F11 input /ja "" <me>; /echo --Fast Casting--')
	send_command('bind !F12 gs c cycle OffenseMode')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Phalanx" <me>')
	send_command('bind ^F4 input /ma "Aquaveil" <me>')
	send_command('bind ^F5 input /ma "Klimaform" <me>')
	send_command('bind ^F6 input /ma "Dispel" <t>')
	send_command('bind ^F7 input /ma "Frazzle" <t>')
	send_command('bind ^F8 input /ma "Distract" <t>')
	send_command('bind ^F9 input /ma "Silence" <t>')
	send_command('bind ^F10 input /ja "Perpetuance" <me>')
	send_command('bind ^F11 input /ja "enlightenment" <me>')
	send_command('bind ^F12 input /ja "tabula rasa" <me>')
	
	send_command('bind @F1 input /ma "poisona" <t>')
	send_command('bind @F2 input /ma "blindna" <t>')
	send_command('bind @F3 input /ma "silena" <t>')
	send_command('bind @F4 input /ma "stona" <t>')
	send_command('bind @F5 input /ma "viruna" <t>')
	send_command('bind @F6 input /ma "cursna" <t>')
	send_command('bind @F7 input /ma "Cure" <t>')
	send_command('bind @F8 input /ma "Cure II" <t>')
	send_command('bind @F9 input /ma "Cure IV" <t>')
	send_command('bind @F10 input /item "Echo Drops" <me>')
	send_command('bind @F11 input /ma "sneak" <t>')
	send_command('bind @F12 input /ma "invisible" <t>')


-- Debuffs ALT	
	send_command('bind !1 input /ja "alacrity" <me>')
	send_command('bind !2 input /ma "regen V" <t>')
	send_command('bind !3 input /ma "Cure III" <t>')
	send_command('bind !4 input /ma "Cure IV" <t>')
	send_command('bind !5 input /ma "Haste" <t>')
	send_command('bind !6 input /ja "accession" <me>')
	send_command('bind !7 input /ma "erase" <t>')
	send_command('bind !8 input /ma "stun" <t>')
	send_command('bind !9 input /ma "Water" <t>')
	send_command('bind !0 input /ma "Fire" <t>')
	send_command('bind !- input /ma "Blizzard" <t>')
	send_command('bind != input /ma "Thunder" <t>')

	
-- Debuffs ALT	
	send_command('bind @1 input /ma "Poisona" <t>')
	send_command('bind @2 input /ma "Silena" <t>')
	send_command('bind @3 input /ma "Blindna" <t>')
	send_command('bind @4 input /ma "Cursna" <t>')
	send_command('bind @5 input /ma "Stona" <t>')
	send_command('bind @6 input /ma "Poisona" <t>')
	send_command('bind @7 input /ma "Viruna" <t>')
	send_command('bind @8 input /ma "Adloquium" <t>')
	send_command('bind @9 input /ma "Regen V" <t>')
	send_command('bind @0 input /ma "Erase" <t>')
	send_command('bind @- input /ja "Sublimation" <me>')
	send_command('bind @= input //exec sch/ice.txt')

-- Misc CTRL	
	send_command('bind ^1 input /ja "light arts" <me>')
	send_command('bind ^2 input /ja "Dark arts" <me>')
	send_command('bind ^3 input /ja "Convert" <me>')
	send_command('bind ^4 input /ja "Sublimation" <me>')
	send_command('bind ^5 input /ma "paralyna" <t>')
	send_command('bind ^6 input /ja "Addendum: White" <me>')
	send_command('bind ^7 input /ja "Addendum: Black" <me>')
	send_command('bind ^8 input //exec sch/fragmentation.txt')
	send_command('bind ^9 input //exec sch/gravitation.txt')
	send_command('bind ^0 input //exec sch/distortion.txt')
	send_command('bind ^- input //exec sch/fusion.txt')
	send_command('bind ^= input //exec sch/dark.txt')
	
end

function user_unload()
    send_command('unbind ^`')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}


    -- Fast cast sets for spells

    sets.precast.FC = {
		main="grioavolr", 
		sub="Enki strap",
		ammo="Sapience orb",
        head=gear.merlinicHood_FC,
		neck="voltsurge torque",
		ear1="Enchanter earring +1",
		ear2="Loquacious Earring",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		ring1="Prolix Ring",
		ring2="Kishar Ring",
        back="Lugh's Cape",
		waist="witful belt",
		legs="Psycloth lappas",
		feet=gear.merlinicCrackows_FC
	}    

    sets.precast.hpDown = {main="Akademos",
        head="Pixie Hairpin +1",neck="Orunmila's Torque",ear1="Regal Earring",ear2="Barkarole Earring",
        body="Jhakri Robe +2",hands="Jhakri Cuffs +2",
        back="Solemnity Cape",legs="Jhakri Slops +2",feet=gear.merlinicCrackows_FC}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Midcast Sets

    sets.midcast.FastRecast = sets.precast.FC

    sets.midcast.Cure = {
		main="Tamaxchi",
		sub="Genbu's Shield",
		ammo="Plumose Sachet",
        head="Kaykaus mitra",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
		hands="Kaykaus cuffs",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Solemnity Cape",
		waist="Hachirin-no-obi",
		legs="Kaykaus Tights",
		feet="Kaykaus Boots"
		}

    sets.midcast.CureCheat = set_combine(sets.midcast.Cure, {ear1="Odnowa Earring +1",ear2="Odnowa Earring",ring1="Vocane Ring +1",ring2="Eihwaz Ring"})

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Cursna = {}

    sets.midcast['Enhancing Magic'] = {
		Main="Gada",
		sub="Ammurapi Shield",
        head="Telchine Cap",
		neck="Incanter's Torque",
        body="Telchine Chasuble",
		hands="Telchine Gloves",
        back="Perimede Cape",
		waist="Hachirin-no-obi",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
		}

	sets.midcast.Haste = sets.midcast['Enhancing Magic']
		
    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {head="Arbatel Bonnet +1",back="Lugh's Cape"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Stone Gorget",waist="Siegel Sash"})

    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {hands="Regal Cuffs"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Pedagogy Loafers"})
	--[[sets.midcast['Voidstorm II'] = sets.midcast.Storm
	sets.midcast['Aurorastorm II'] = sets.midcast.Storm
	sets.midcast['Sandstorm II'] = sets.midcast.Storm
	sets.midcast['Rainstorm II'] = sets.midcast.Storm
	sets.midcast['Windstorm II'] = sets.midcast.Storm
	sets.midcast['Firestorm II'] = sets.midcast.Storm
	sets.midcast['Hailstorm II'] = sets.midcast.Storm
	sets.midcast['Thunderstorm II'] = sets.midcast.Storm]]--


    -- Custom spell classes
    sets.midcast['Enfeebling Magic'] = {main="Akademos",sub="Enki strap",ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,neck="Erra Pendant",ear1="Regal Earring",ear2="Barkarole Earring",
        body=gear.merlinicJubbah_Magic,hands="Regal Cuffs",ring1="Kishar Ring",ring2="Sangoma Ring",
        back="Lugh's Cape",waist="Eschan Stone",legs=gear.merlinicShalwar_Magic,feet=gear.merlinicCrackows_Magic}

    sets.midcast['Dark Magic'] = {main="Akademos",sub="Enki strap",ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,neck="Erra Pendant",ear1="Etiolation Earring",
        body=gear.merlinicJubbah_Magic,hands="Jhakri Cuffs +2",ring1="Evanescence Ring",ring2="Sangoma Ring",
        back="Lugh's Cape",waist="Goading Belt",legs=gear.merlinicShalwar_Magic,feet=gear.merlinicCrackows_Magic}

    sets.midcast.Kaustra = {main="Akademos",sub="Enki strap",ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Barkarole Earring",
        body=gear.merlinicJubbah_Magic,hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Lugh's Cape",waist="Eschan Stone",legs=gear.merlinicShalwar_Magic,feet=gear.merlinicCrackows_Magic}

    sets.midcast.Drain = sets.midcast['Dark Magic']

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = sets.midcast['Dark Magic']

    sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {main="Akademos"})


    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Akademos",sub="Enki strap",ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Barkarole Earring",
        body=gear.merlinicJubbah_Magic,hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Lugh's Cape",waist=gear.ElementalObi,legs=gear.merlinicShalwar_Magic,feet=gear.merlinicCrackows_Magic}
		
	sets.midcast['Elemental Magic'].NormalMP = set_combine(sets.midcast['Elemental Magic'], {body="Seidr Cotehardie"})
		
	sets.midcast['Elemental Magic'].Lockset = set_combine(sets.midcast['Elemental Magic'], {hands="Arbatel Bracers +1",feet="Arbatel Loafers +1"})
	
	sets.midcast['Elemental Magic'].MB = set_combine(sets.midcast['Elemental Magic'], {neck="Mizukage-no-Kubikazari",lring="Mujin Band"})
		
	sets.midcast['Elemental Magic'].MBMP = set_combine(sets.midcast['Elemental Magic'].MB, {body="Seidr Cotehardie"})
	
	sets.midcast['Elemental Magic'].Helix = set_combine(sets.midcast['Elemental Magic'], {waist="Eschan Stone"})
	
    sets.midcast['Noctohelix II'] = set_combine(sets.midcast['Elemental Magic'].Helix, {head="Pixie Hairpin +1",ring2="Archon Ring"})
    sets.midcast['Noctohelix'] = set_combine(sets.midcast['Elemental Magic'].Helix, {head="Pixie Hairpin +1",ring2="Archon Ring"})
	
	
	sets.midcast['Elemental Magic'].MB.Helix = set_combine(sets.midcast['Elemental Magic'].MB, {waist="Eschan Stone"})
	
    -- Custom refinements for certain nuke tiers
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'].MB, {body="Twilight Cloak",head=""})
	
    sets.midcast['Elemental Magic'].Proc = sets.idle


    -- Sets to return to when not performing an action.

    -- Resting sets
    sets.resting = {}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
		main="Terra's Staff", 
		sub="Umbra Strap",
		ammo="Homiliary",
        head="befouled crown",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Odnowa earring +1",
        body="Witching Robe",
		hands="Serpentes cuffs",
		ring1="warden's Ring",
		ring2="Defending Ring",
        back="mecistopins mantle",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Herald's Gaiters"
		}

    sets.idle.PDT = sets.idle

    sets.idle.Stun = set_combine(sets.idle, {main="Akademos",sub="Enki strap",
        head=gear.merlinicHood_FC,neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
        body="Zendik Robe",hands=gear.merlinicDastanas_FC,
        legs=gear.psyclothLappas_FC,feet=gear.merlinicCrackows_FC})

    sets.idle.Sphere = set_combine(sets.idle, {body="Zendik Robe"})

    sets.idle.Weak = sets.idle

    -- Defense sets

    sets.defense.PDT = sets.idle

    sets.defense.MDT = sets.idle

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
		head="Volte Cap",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Telos Earring",
		body="Onca Suit",hands="",ring1="Rajas Ring",ring2="Petrov Ring",
		back="Moonbeam Cape",waist="Goading Belt",legs="",feet=""}
		
	--sets.engaged = sets.idle.Field.PDT
	
	sets.precast.WS = {neck="Fotia Gorget",waist="Fotia Belt"}
	
	sets.precast.WS['Myrkr'] = {ammo="Ghastly Tathlum +1",
		head=gear.merlinicHood_FC,neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Moonshade Earring",
		body=gear.merlinicJubbah_Magic,hands="Telchine Gloves",ring1="Vocane Ring +1",ring2="Sangoma Ring",
		back="Moonbeam Cape",waist="Fucho-no-Obi",legs=gear.psyclothLappas_FC,feet="Arbatel Loafers +1"}



    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {}--{head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1", back="Lugh's Cape"}
    sets.buff['Penury'] = {}
    sets.buff['Parsimony'] = {}
    sets.buff['Celerity'] = {feet="Pedagogy Loafers"}
    sets.buff['Alacrity'] = sets.buff['Celerity']

    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
	sets.buff['Reive Mark'] = {}
	
	sets.Flicker = {hands="Amalric Gages"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	if spell.type == "Scholar" or spell.type == "JobAbility" then
		--send_command('echo test')
		equip(sets.Flicker)
	end
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Goading Belt"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
    elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
        gear.default.obi_waist = "Eschan Stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
		if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
    if spell.english == "Cure III" and spell.target.name == "Radec" then
        equip(sets.precast.hpDown)
        eventArgs.handled = true
    end
end

-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.english:match('helix') or spell.english:match('helix II') then
		if state.CastingMode.value == 'MB' or state.CastingMode.value == 'MBMP' then
			equip(sets.midcast['Elemental Magic'].Helix.MB)
		else
			equip(sets.midcast['Elemental Magic'].Helix)
		end
	end
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
    if spell.english == "Cure III" and spell.target.name == "Radec" then
        equip(sets.midcast.CureCheat)
        eventArgs.handled = true
    end
end

function job_aftercast(spell, action, spellMap, eventArgs)
    -- custom_aftermath_timers_aftercast(spell)
    -- Lock back after using Mana Wall.
    if not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('back')
            equip(sets.buff['Mana Wall'])
            disable('back')
        end
        if spell.english == 'Sleepga II' or spell.english == 'Sleep II' then
            send_command('input /'..state.ChatMode.value..' '..spell.english..' [1:57]; wait 57; input /'..state.ChatMode.value..' '..spell.english..' [1:00]; wait 30; input /'..state.ChatMode.value..'  '..spell.english..' [0:30]; wait 15; input /'..state.ChatMode.value..'  '..spell.english..' [0:15]; wait 10; input /'..state.ChatMode.value..'  '..spell.english..' [0:05];')
        elseif spell.english == 'Sleepga' or spell.english == 'Sleep' then
            send_command('input /'..state.ChatMode.value..' '..spell.english..' [1:18]; wait 48; input /'..state.ChatMode.value..'  '..spell.english..' [0:30]; wait 15; input /'..state.ChatMode.value..'  '..spell.english..' [0:15]; wait 10; input /'..state.ChatMode.value..'  '..spell.english..' [0:05];')
        elseif spell.english == 'Breakga' or spell.english == 'Break' then
            send_command('input /'..state.ChatMode.value..'  '..spell.english..' [0:39]; wait 24; input /'..state.ChatMode.value..'  '..spell.english..' [0:15]; wait 10; input /'..state.ChatMode.value..'  '..spell.english..' [0:05];')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" and gain then
        handle_equipping_gear(player.status)
    end
    if buff == "Reive Mark" and gain then
		equip(sets.buff['Reive Mark'])
        disable('neck')
    end
    if buff == "Reive Mark" and not gain then
        enable('neck')
        handle_equipping_gear(player.status)
    end
end

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

end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' and spellMap ~= 'ElementalEnfeeble' then
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use

    if not cmdParams[2] then
        add_to_chat(123,'Error: No strategem command given.')
        return
    end
    local strategem = cmdParams[2]:lower()

    if strategem == 'light' then
        if buffactive['light arts'] then
            send_command('input /ja "Addendum: White" <me>')
        elseif buffactive['addendum: white'] then
            add_to_chat(122,'Error: Addendum: White is already active.')
        else
            send_command('input /ja "Light Arts" <me>')
        end
    elseif strategem == 'dark' then
        if buffactive['dark arts'] then
            send_command('input /ja "Addendum: Black" <me>')
        elseif buffactive['addendum: black'] then
            add_to_chat(122,'Error: Addendum: Black is already active.')
        else
            send_command('input /ja "Dark Arts" <me>')
        end
    elseif buffactive['light arts'] or buffactive['addendum: white'] then
        if strategem == 'cost' then
            send_command('input /ja Penury <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Celerity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Accession <me>')
        elseif strategem == 'power' then
            send_command('input /ja Rapture <me>')
        elseif strategem == 'duration' then
            send_command('input /ja Perpetuance <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Altruism <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Tranquility <me>')
        elseif strategem == 'skillchain' then
            add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: White" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    elseif buffactive['dark arts']  or buffactive['addendum: black'] then
        if strategem == 'cost' then
            send_command('input /ja Parsimony <me>')
        elseif strategem == 'speed' then
            send_command('input /ja Alacrity <me>')
        elseif strategem == 'aoe' then
            send_command('input /ja Manifestation <me>')
        elseif strategem == 'power' then
            send_command('input /ja Ebullience <me>')
        elseif strategem == 'duration' then --This just makes more sense
            send_command('input /ja Immanence <me>')
        elseif strategem == 'accuracy' then
            send_command('input /ja Focalization <me>')
        elseif strategem == 'enmity' then
            send_command('input /ja Equanimity <me>')
        elseif strategem == 'skillchain' then
            send_command('input /ja Immanence <me>')
        elseif strategem == 'addendum' then
            send_command('input /ja "Addendum: Black" <me>')
        else
            add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
        end
    else
        add_to_chat(123,'No arts has been activated yet.')
    end
end


-- Gets the current number of available strategems based on the recast remaining
-- and the level of the sch.
function get_current_strategem_count()
    -- returns recast in seconds.
    local allRecasts = windower.ffxi.get_ability_recasts()
    local stratsRecast = allRecasts[231]

    local maxStrategems = 5

    local fullRechargeTime = 5*33

    local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)

    return currentCharges
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
end
