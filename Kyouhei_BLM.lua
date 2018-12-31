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
    include('Kyouhei-Include.lua')
	send_command('alias MMPP input /ws "Myrkr"; input /echo  Myrkr ;')
	send_command('alias echos input /item "Echo Drops" <me>; input /echo  ECHO DROPS;')
	send_command('alias reme input /item "Remedy" <me>; input /echo  Remedy;')
	send_command('alias stuncycle input /ma "Stun" <t>; input /p      Next Stunner = [[  MEMO  ]];')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'MB', 'MeritNOMB', 'MBMerit')
    state.IdleMode:options('Normal', 'Refresh', 'PDT', 'EXP')
	
-- 	Buffs ALT
	send_command('bind !F1 input /ma "Drain" <t>')
	send_command('bind !F2 input /ma "Aspir" <t>')
	send_command('bind !F3 input /ma "Aspir II" <t>')
	send_command('bind !F4 input /ma "Aspir III" <t>')
	send_command('bind !F5 input /ma "Bind" <t>')
	send_command('bind !F6 input /ma "Gravity" <t>')
	send_command('bind !F7 input /ma "Stun" <t>')
	send_command('bind !F8 input /ma "Sleep" <t>')
	send_command('bind !F9 input /ma "Sleep II" <t>')
	send_command('bind !F10 input /ja "Manifestation" <me>; /echo --AOE Dark--')
	send_command('bind !F11 gs c cycle CastingMode')
	send_command('bind !F12 gs c cycle OffenseMode')
	
-- 	Buffs CTRL
	send_command('bind ^F1 input /ma "Blink" <me>')
	send_command('bind ^F2 input /ma "Stoneskin" <me>')
	send_command('bind ^F3 input /ma "Phalanx" <me>')
	send_command('bind ^F4 input /ma "Aquaveil" <me>')
	send_command('bind ^F5 input /ma "Klimaform" <me>')
	send_command('bind ^F6 input /ma "Dispel" <t>')
	send_command('bind ^F7 input ')
	send_command('bind ^F8 input ')
	send_command('bind ^F9 input /ma "Impact" <t>; /echo --Impact--')
	send_command('bind ^F10 input /ma "Comet" <t>; /echo --Comet--')
	send_command('bind ^F11 input /ma "Death" <t>; /echo --Death--')
	send_command('bind ^F12 input /ja "Manawell" <me>')


--[[Debuffs ALT	
	send_command('bind !1 input //exec sch/stone.txt')
	send_command('bind !2 input ///exec sch/water.txt')
	send_command('bind !3 input //exec sch/wind.txt')
	send_command('bind !4 input //exec sch/fire.txt')
	send_command('bind !5 input //exec sch/ice.txt')
	send_command('bind !6 input //exec sch/thun.txt')
	send_command('bind !7 input //exec sch/dark.txt')
	send_command('bind !8 input //exec sch/light.txt')
	send_command('bind !9 input //exec sch/4step.txt')
	send_command('bind !0 input //exec sch/6step.txt')
	send_command('bind !- input /ja "Sublimation" <me>')
	send_command('bind != gs c cycle IdleMode')
	]]--
	
 --Debuffs ALT	
	send_command('bind !1 input /ma "Paralyna" <t>')
	send_command('bind !2 input /ma "Silena" <t>')
	send_command('bind !3 input /ma "Blindna" <t>')
	send_command('bind !4 input /ma "Cursna" <t>')
	send_command('bind !5 input /ma "Stona" <t>')
	send_command('bind !6 input /ma "Poisona" <t>')
	send_command('bind !7 input /ma "Viruna" <t>')
	send_command('bind !8 input /ma "Adloquium" <t>')
	send_command('bind !9 input /ma "Regen V" <t>')
	send_command('bind !0 input /ma "Erase" <t>')
	send_command('bind !- input /ja "Sublimation" <me>')
	send_command('bind != gs c cycle IdleMode')

-- Misc CTRL	
	send_command('bind ^1 input /item "Oracle\'s Drink" <me>')
	send_command('bind ^2 input /item "Braver\'s Drink" <me>')
	send_command('bind ^3 input /item "Assassin\'s Drink" <me>')
	send_command('bind ^4 input /item "Soldier\'s Drink" <me>')
	send_command('bind ^5 input /item "Lucid Elixir" <me>')
	send_command('bind ^6 input /item "Lucid Elixir II" <me>')
	send_command('bind ^7 input /ma "Stun" <t>')
	send_command('bind ^8 input input /item "Megalixir" <me>')
	send_command('bind ^9 input input /item "Mana Powder" <me>')
	send_command('bind ^0 input input /item "Cleric\'s Drink" <me>')
	send_command('bind ^- input input /item "Healing Powder" <me>')
	send_command('bind ^= input /ja "Alacrity" <me>')

end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = { 
		ammo="Sapience Orb",
		head= gear.merlinicHood_FC,
		neck="Orunmila's Torque",
		ear1="Loquacious Earring",
		ear2="Enchanter Earring +1",
        body=gear.merlinicJubbah_FC,
		hands=gear.merlinicDastanas_FC,
		waist="Channeler's Stone",
		ring1="Prolix Ring",
		ring2="Kishar Ring",
		back="Bane Cape",
		legs="Psycloth lappas",
		feet=gear.merlinicCrackows_FC
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = sets.precast.FC['Enhancing Magic']

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		ear2="Mendicant's earring"
	})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, { 
		ear2="Barkaro. Earring"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		body="Heka's kalasiris",  
		ear2="Mendicant's earring", 
	})
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {body="Twilight Cloak",head=""})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] = {Back="Taranus's Cape"}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
	
	--Default WS MND

	
	--Gorget	
		
	sets.precast.WS['Myrkr'] = {
		ammo="Strobilus",
		head="Pixie Hairpin +1",
		neck="Sanctity Necklace",
		ear1="Etiolation Earring",
		ear2="Halasz Earring",
		body="Vanya Robe",
		hands="Telchine gloves",
		ring1="Prolix Ring",
		ring2="Lebeche Ring",
		back="Bane Cape",
		waist="Luminary Sash",
		legs="Psycloth Lappas",
		feet="Telchine pigaches"
	}	
		
	sets.precast.WS['Earth Crusher'] = {
		ammo="Pemphredo tathlum",
        head="Jhakri Coronal +1",
		neck="Sanctity Necklace",
		ear1="Brutal Earring",
		ear2="Zennaroi earring",
        body="Jkari Robe +1",
		hands="Jhakri Cuffs +2",
		ring1="Cacoethic Ring +1",
		ring2="Cacoethic Ring",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Jhakri Slops",
		feet="Jhakri pigaches +2"
	}

	sets.precast.WS['Rock Crusher'] = sets.precast.WS['Earth Crusher']
	
    -- Cure sets

    sets.midcast.Cure = {
		ammo="Hydrocera",
        head="Vanya Hood",
		neck="Incanter's Torque",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
		hands="Telchine Gloves",
		body="Vrikodara Jupon",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Solemnity Cape",
		waist="Austerity Belt +1",
		legs="Gyve Trousers",
		feet="Vanya Clogs"
	}

	sets.midcast.CureMelee = sets.midcast.Cure
    sets.midcast.Curaga = sets.midcast.Cure
	
	sets.midcast.conserve = {
		ammo="Pemphredo tathlum",
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Magnetic Earring",
        back="Solemnity cape",
		waist="Austerity Belt +1",
		legs="Vanya slops",
		feet=gear.merlinicCrackows_Magic
	}
	
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve

    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
        head="Befouled crown",
		neck="Incanter's Torque",
		ear1="Andoaa earring",
        body="Anhur Robe",
		hands="Telchine Gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Shedir Seraweels",
		feet=gear.telchinePigaches_Enhancing
	}
	
	sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'],{
		head="Telchine Cap",
		body=gear.telchineChasuble_Enhancing,
		hands="Telchine Gloves",
		legs=gear.telchineBraconi_Enhancing,
		feet=gear.telchinePigaches_Enhancing
	})
	
	sets.midcast.Refresh = sets.midcast.Haste
	sets.midcast.Klimaform = sets.midcast.Haste
	sets.midcast.Storm = sets.midcast.Haste

	
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		neck="Stone Gorget",
		waist="Siegel Sash",
		legs="Shedir Seraweels"
	})

	--state.CastingMode:options('Normal', 'MB', 'NormalMerit', 'MBMerit')
   
 	sets.midcast['Elemental Magic'] = {ammo="Pemphredo tathlum",
        head="Jhakri coronal +2",neck="Sanctity necklace",ear1="Regal earring",ear2="Barkarole earring",
        body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Shiva Ring +1",ring2="Strendu ring",
        back=gear.TaranussCape_Magic,waist=gear.ElementalObi,legs="Jhakri slops +2",feet="Jhakri pigaches +2"}
	
	sets.midcast['Elemental Magic'].MB = {
		ammo="Pemphredo tathlum",
		head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Regal Earring",
		ear2="Barkaro. Earring",
        body=gear.merlinicJubbah_Magic,
		hands="Amalric gages +1",
		ring1="Shiva Ring +1",
		ring2="Mujin Band",
        back="Taranus's Cape",
		waist=gear.ElementalObi,
		legs="Merlinic Shalwar",
		feet=gear.merlinicCrackows_Magic
	}
 
	sets.midcast['Elemental Magic'].MeritNOMB = set_combine(sets.midcast['Elemental Magic'],{
		neck="Saevus pendant +1",
        body="Spaekona's Coat +3",
		hands="Jhakri Cuffs +2",
		ring1="Strendu Ring"
	})
	
	sets.midcast['Elemental Magic'].NormalMerit = set_combine(sets.midcast['Elemental Magic'],{
        body="Spaekona's Coat +2"
	})	

	sets.midcast['Elemental Magic'].NOMB = set_combine(sets.midcast['Elemental Magic'],{
		neck="Saevus Pendant +1",
		hands="Jhakri Cuffs +2",
		ring1="Strendu Ring"
	})
	
	 sets.midcast.Death = set_combine(sets.midcast['Elemental Magic'],{
		head="Pixie Hairpin +1",
		hands="Amalric gages +1",
		ring2="Archon Ring"
	})
	
	sets.midcast.Death.MB = set_combine(sets.midcast['Elemental Magic'],{
		head="Pixie Hairpin +1",
		hands="Amalric gages +1",
		ring1="Archon Ring",
		ring2="Mujin band"
	})
	
	sets.midcast.Comet = sets.midcast.Death
	sets.midcast.Comet.MB = sets.midcast.Death
	
	sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'],{
		head="",
        body="Twilight Cloak",
		ring1="Mujin band",
		ring2="Archon Ring"
	})
	
	sets.midcast.Impact.MB = set_combine(sets.midcast['Elemental Magic'],{
		head="",
        body="Twilight Cloak",
		ring1="Archon Ring",
		ring2="Mujin band"
	})

    sets.midcast['Dark Magic'] = {
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Erra Pendant",
		ear1="Barkaro. Earring",
		ear2="Enchanter Earring +1",
        body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		ring1="Evanescence Ring",
		ring2="Archon Ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Merlinic Shalwar",
		feet="Jhakri pigaches +2"
	}
	
	sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {
		ring2="Vertigo Ring"
	})	
	
	
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
		head=gear.merlinicHood_Magic,
		neck="Erra Pendant", 
		ear1="Hirudinea earring", 
		ear2="Barkaro. Earring",
		ring2="Evanscence ring",
		waist="Fucho-no-Obi",
		feet=gear.merlinicCrackows_Magic
	})
	
	sets.midcast.Aspir = sets.midcast.Drain
	
    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		ammo="Hydrocera",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Spaekona's Coat +2",
		hands="Jhakri Cuffs +2",
		ring1="Kishar Ring",
		ring2="Leviathan Ring",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Merlinic Shalwar",
		feet="Jhakri pigaches +2"
	}

    sets.midcast.IntEnfeebles = {
		ammo="Pemphredo tathlum",
        head=gear.merlinicHood_Magic,
		neck="Incanter's Torque",
		ear1="Barkaro. Earring",
		ear2="Enchanter Earring +1",
		body="Spaekona's Coat +2",
		hands="Jhakri Cuffs +2",
		ring2="Kishar ring",
		ring2="Shiva Ring +1",
        back="Taranus's Cape",
		waist="Luminary sash",
		legs="Merlinic Shalwar",
		feet="Jhakri pigaches +2"
	}

	sets.midcast.Sleep = set_combine(sets.midcast.IntEnfeebles, {
		ring2="Archon Ring"
	})
	
	sets.midcast.Sleepga = sets.midcast.Sleep	
	
    
    -- Sets to return to when not performing an action.
  
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
		ammo="Staunch tathlum",
        head=gear.merlinicHood_Ref,
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Shamash robe",
		hands=gear.merlinicDastanas_Ref,
		ring1="Dark Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Mallquis Clogs +2"
	}

    sets.idle.Refresh = {
		ammo="Sihirik",
        head="Befouled Crown",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Etiolation Earring",
        body="Jhakri Robe +2",
		hands="Amalric gages +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Herald's Gaiters"
	}	
		
    sets.idle.PDT = {
		ammo="Sihirik",
        head="Blistering Sallet +1",
		neck="Loricate Torque +1",
		ear1="Moonshade earring",
		ear2="Etiolation Earring",
        body="Vrikodara Jupon",
		hands="Jhakri Cuffs +2",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor sash",
		legs="Gyve Trousers",
		feet="Mallquis clogs +1"
		}
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Blistering Sallet +1",
		neck="Loricate Torque +1",
		ear1="Brutal Earring",
		ear2="Zennaroi earring",
        body="Jkari Robe +1",
		hands="Jhakri Cuffs +2",
		ring1="Cacoethic Ring +1",
		ring2="Cacoethic Ring",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Jhakri Slops +1",
		feet="Jhakri pigaches +2"
	}

	
	sets.latent_refresh = {waist="Fucho-no-Obi"}


	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change. Turn this one to Meele.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------


function job_precast(spell, action, spellMap, eventArgs)
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Pythia Sash +1"
		if spell.element == world.weather_element or
		spell.element == world.day_element then 
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' then
		gear.default.obi_waist = "Refoccilation Stone"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
		if state.CastingMode.value == 'Proc' then
			classes.CustomClass = 'Proc'
		end
	end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
