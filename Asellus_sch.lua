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
	include('Asellus-Include.lua')
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
    state.CastingMode:options('Normal', 'Resistant', 'Merit')
    state.IdleMode:options('Normal', 'Refresh', 'PDT')
	
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

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
		main="grioavolr", 
		sub="Enki strap",
		ammo="Sapience Orb",
        head=gear.merlinicHood_FC,
		neck="baetyl pendant",
		ear1="Etiolation earring",
		ear2="Loquacious Earring",
        body="Shango robe",
		hands=gear.merlinicDastanas_FC,
		ring1="Prolix Ring",
		ring2="Kishar Ring",
        back="Lugh's Cape",
		waist="witful belt",
		legs="Psycloth lappas",
		feet=gear.merlinicCrackows_FC
	}
	
	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = sets.precast.FC['Enhancing Magic']

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, { 
		main="Vadose Rod", 
		sub="Genmei Shield",
		head="Kaykaus mitra",
		neck="Nodens Gorget",
		ear2="Mendicant's earring",
		back="Pahtli cape",
		body="Kaykaus Bliaut",
		hands="Kaykaus Cuffs",
		legs="Kaykaus Tights",
		feet="Kaykaus Boots"
	})

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {
		sub="Sors Shield",
		body="Heka's kalasiris",  
		ear2="Mendicant's earring", 
	})
	
    sets.precast.FC.Curaga = sets.precast.FC.Cure
	
    -- Precast sets to enhance JAs
    sets.precast.JA.Immanence = {hands="Arbatel bracers "}
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Fotia Gorget"
    gear.default.weaponskill_waist = "Fotia Belt"
	
	--Default WS MND
    sets.precast.WS = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Inyanga Dastanas +1",
		ring1="Aquasoul Ring",
		ring2="Spiral ring",
        back="Lifestream Cape",
		waist="Pythia Sash +1",
		legs="Vanya slops",
		feet="Inyanga crackows +1"
	}
	
	--WS, MAB Based
    sets.precast.WS['Flash Nova'] = {
        head="Vanya hood",
		neck="Eddy Necklace",
		ear1="Novio Earring",
		ear2="Hecate earring",
        body="Vanya Robe",
		hands="Inyanga Dastanas +1",
		ring1="Prolix ring",
		ring2="Acumen ring",
        back="Lifestream Cape",
		waist="Maniacus sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1s"
	}
	
	-- WS With Gorget/Mnd	
	sets.precast.WS['Realmrazer'] = {
        head="Vanya hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Inyanga Dastanas +1",
		ring1="Tamas ring",
		ring2="Aquasoul ring",
        back="Lifestream Cape",
		waist="Fotia Belt",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
	}
	
	--Gorget	
	sets.precast.WS['Hexastrike'] = {	
        head="Vanya Hood",
		neck="Fotia Gorget",
		ear1="Nourishing earring +1",
		ear2="Brutal Earring",
        body="Vanya robe",
		hands="Inyanga Dastanas +1",
		ring1="Mars's Ring",
		ring2="Spiral Ring",
        back="Lifestream Cape",
		waist="Fotia Belt",
		legs="Vanya slops",
		feet="Inyanga crackows +1"
	}
		
		

    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        main="Terra's Staff", 
		sub="Giuoco Grip",
		ammo="Incantor Stone",
        head="Vanya Hood",
		neck="Orison Locket",
		ear2="Loquacious Earring",
        body="Inyanga Jubbah +1",
		hands="Gendewitha Gages",
		ring1="Prolix Ring",
		ring2="Veneficium Ring",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Querkening brais",
		feet="Chelona Boots"
	}
    
    -- Cure sets
    gear.default.obi_waist = "Pythia sash +1"
    gear.default.obi_back = "Lifestream Cape"

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
        back="Oretania's cape +1",
		waist="Pythia sash +1",
		legs="Kaykaus Tights",
		feet="Kaykaus Boots"
	}

    sets.midcast.Curaga = {
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
        back="Oretania's cape +1",
		waist="Pythia sash +1",
		legs="Vanya Slops",
		feet="Kaykaus Boots"
	}
	
	sets.midcast.conserve = {
		main="Terra's Staff",
		sub="Clemency Grip",
        head="Vanya Hood",
		neck="Incanter's torque",
		ear1="Calamitous Earring",
		ear2="Mendicant's Earring",
        body="Hedera Cotehardie",
        back="Vita Cape",
		waist="Pythia sash +1",
		legs="Vanya slops",
		feet="Kaykaus Boots"
	}
	
	sets.midcast['Arise'] = sets.midcast.conserve
	sets.midcast.Raise = sets.midcast.conserve
	sets.midcast.Reraise = sets.midcast.conserve
	sets.midcast.Teleport = sets.midcast.conserve
	sets.midcast.Recall = sets.midcast.conserve
	
	
    sets.midcast.CureMelee = {
        head="Kaykaus mitra",
		neck="Nodens Gorget",
		ear1="Novia Earring",
		ear2="Mendicant's Earring",
        body="Orison Bliaud +2",
		hands="Augur's Gloves",
		ring1="Haoma's Ring",
		ring2="Sirona's Ring",
        back="Lifestream Cape",
		waist="Pythia sash +1",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}

    sets.midcast.Cursna = {
        head="Kaykaus mitra",
		neck="Malison Medallion",
        body="Orison Bliaud +2",
		hands="Fanatic Gloves",
		ring1="Haoma's ring",
		ring2="Haoma's ring",
        back="Lifestream Cape",
		waist="Ninurta's Sash",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}

    sets.midcast.StatusRemoval = {
        head="Kaykaus mitra",
		neck="Colossus's Torque",
        body="Orison Bliaud +2",
		hands="Augur's Gloves",
		ring1="Haoma's ring",
		ring2="Sirona's Ring",
        back="Lifestream Cape",
		waist="Ninurta's Sash",
		legs="Vanya Slops",
		feet="Vanya clogs"
	}


    -- Enhancing Magic Skill
    sets.midcast['Enhancing Magic'] = {
		Main="Gada",
		sub="Ammurapi Shield",
        head="Telchine Cap",
		neck="Incanter's Torque",
        body="Telchine Chasuble",
		hands="Telchine Gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
	}

	sets.midcast.Haste = sets.midcast['Enhancing Magic']
	
    sets.midcast.Stoneskin = {
		neck="Stone Gorget",
		waist="Siegel Sash",
		legs="Haven Hose"
	}

    sets.midcast.BarElement = {
        head="Umuthi hat",
		neck="Incanter's Torque",
        body="Anhur Robe",
		hands="Chironic gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Portent Pants"
	}

    sets.midcast.Regen = {
		Main="Gada",
		sub="Ammurapi Shield",
        head="Telchine Cap",
		neck="Incanter's Torque",
        body="Telchine Chasuble",
		hands="Telchine Gloves",
        back="Merciful Cape",
		waist="Olympus Sash",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"
	}

    sets.midcast.Protectra = {ring1="Sheltered Ring",feet="Piety Duckbills"}

    sets.midcast.Shellra = {ring1="Sheltered Ring",legs="Piety Pantaloons"}

    sets.midcast['Divine Magic'] = {
		main="Chatoyant Staff",
		sub="Achaq Grip",
        head="Inyanga Tiara +1",
		neck="Eddy Necklace",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Inyanga Jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Perception ring",
		ring2="Aquasoul Ring",
        back="Lifestream Cape",
		waist="Witch's Sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
	}
  
    sets.midcast.Banish = {
		main="Owleyes", 
		sub="Genbu's Shield",
        head="Inyanga Tiara +1",
		neck="Mizukage-no-Kubikazari",
		ear1="Novio Earring",
		ear2="Hecate's earring",
        body="Vanya Robe",
		hands="Inyanga Dastanas +1",
		ring1="Strendu Ring",
		ring2="Acumen ring",
        back="Lifestream Cape",
		waist="Witch's Sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
	}
   
 	sets.midcast['Elemental Magic'] = {
		main="Akademos", 
		sub="Niobid strap",
		ammo="Pemphredo Tathlum",
        head=gear.merlinicHood_Magic,
		neck="Mizukage-no-Kubikazari",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Jhakri Robe +1",
		hands="Amalric Gages",
		ring1="Strendu Ring",
		ring2="Mujin Band",
        back="Lugh's Cape",
		waist="Refoccilation stone",
		legs=gear.merlinicShalwar_Magic,
		feet=gear.merlinicCrackows_Magic
	}
 
	sets.midcast['Elemental Magic'].Resistant = {
		main="Akademos", 
		sub="Enki strap",
		ammo="Pemphredo Tathlum6",
		head="Merlinic Hood",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Jhakri Robe +1",
		hands="Jhakri Cuffs +1",
		ring1="Strendu Ring",
		ring2="Mujin Band",
        back="Lugh's Cape",
		waist="Refoccilation stone",
		legs="Merlinic Shalwar",
		feet="Merlinic Crackows"
	}	
	
	sets.midcast['Elemental Magic'].Merit = {
		main="Akademos", 
		sub="Enki strap",
		ammo="Hydrocera",
		head="Merlinic Hood",
		neck="Sanctity Necklace",
		ear1="Friomisi Earring",
		ear2="Barkaro. Earring",
        body="Seidr Cotehardie",
		hands="Almalric Gages",
		ring1="Strendu Ring",
		ring2="Mujin Band",
        back="Lugh's Cape",
		waist="Refoccilation stone",
		legs="Merlinic Shalwar",
		feet="Merlinic Crackows"
	}	

	
	sets.midcast.sleep = {
		main="Akademos",
		sub="Benthos Grip",
		ammo="Plumos Sachet",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +1",
		hands="Kaykaus Cuffs",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Lugh's Cape",
		waist="Casso Sash",
		legs="Jhakri Slops +1",
		feet="Uk'uxkaj boots"
	}	
		
    sets.midcast['Dark Magic'] = {
		main="Akademos",
		sub="Benthos Grip",
		ammo="Plumos Sachet",
        head="Befouled Crown",
		neck="Incanter's Torque",
		ear1="Psystorm Earring",
		ear2="Lifestorm Earring",
        body="Jhakri robe +1",
		hands="Kaykaus Cuffs",
		ring1="Archon Ring",
		ring2="Vertigo Ring",
        back="Lugh's Cape",
		waist="Casso Sash",
		legs="Jhakri Slops +1",
		feet="Uk'uxkaj boots"
	}
	
	sets.midcast.drain = set_combine(sets.midcast['Dark Magic'], {
		head="Merlinic Hood",
		ring1="Excelsis Ring",
		ring2="Evanscence ring",
		legs="Jhakri Slops +1",
		feet="Merlinic Crackows"
	})
	
	sets.midcast.aspir = set_combine(sets.midcast['Dark Magic'], {
		head="Merlinic Hood",
		ring1="Excelsis Ring",
		ring2="Evanscence ring",
		legs="Jhakri Slops +1",
		feet="Merlinic Crackows"
	})
	
	

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {
		main="Ababinili +1", 
		sub="Achaq Grip",
		ammo="Seraphic Ampulla",
        head="Inyanga Tiara +1",
		neck="Incanter's Torque",
		ear1="Nourishing earring +1",
		ear2="Pensee earring",
        body="Inyanga Jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Perception ring",
		ring2="Aquasoul Ring",
        back="Lugh's Cape",
		waist="Pythia Sash",
		legs="Inyanga Shalwar +1",
		feet="Piety Duckbills"
	}

    sets.midcast.IntEnfeebles = {
		main="Akademos", 
		sub="Wizzan Grip", 
		ammo="Seraphic Ampulla",
        head="Inyanga Tiara +1",
		neck="Incanter Torque",
		ear1="Psystorm earring",
		ear2="Mendicant's Ring",
        body="Inyanga jubbah +1",
		hands="Inyanga Dastanas +1",
		ring1="Acumen ring",
		ring2="Diamond Ring",
        back="Lugh's Cape",
		waist="Witch Sash",
		legs="Inyanga Shalwar +1",
		feet="Piety Duckbills"
	}

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {
		main="Numen Staff", 
		sub="Achaq Grip",
		ammo="Homiliary",
        head="Orvail Corona +1",
		neck="Jeweled collar",
		ear1="Moonshade Earring",
		ear2="Relaxing Earring",
        body="Oracle's robe",
		hands="Nares Cuffs",
		ring1="Prolix Ring",
		ring2="Tamas Ring",
        back="Vita Cape",
		waist="Cleric's belt",
		legs="Menhit slacks",
		feet="Chelona Boots"
	}
    

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

    sets.idle.Refresh = {
		main="Terra's Staff", 
		sub="Giuoco Grip",
		ammo="Homiliary",
        head="Wivre Hairpin",
		neck="Loricate Torque +1",
		ear1="Moonshade Earring",
		ear2="Loquacious Earring",
        body="Witching robe",
		hands="Serpentes cuffs",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor Sash",
		legs="Assiduity pants +1",
		feet="Serpentes sabots"
	}	
		
    sets.idle.PDT = {
		main="Terra's Staff", 
		sub="Giuoco Grip",
		ammo="Homiliary",
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Moonshade earring",
		ear2="Novia Earring",
        body="Witching robe",
		hands="Inyanga Dastanas +1",
		ring1="Vocane Ring",
		ring2="Defending Ring",
        back="Umbra Cape",
		waist="Slipor sash",
		legs="Inyanga Shalwar +1",
		feet="Inyanga crackows +1"
		}
    
    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Vanya Hood",
		neck="Loricate Torque +1",
		ear1="Brutal Earring",
		ear2="Suppanomimi",
        body="Wayfarer Robe",
		hands="Inyanga dastanas +1",
		ring1="Mars's Ring",
		ring2="Spiral ring",
        back="Umbra Cape",
		waist="Ninurta's Sash",
		legs="Vanya slops",
		feet="Vanya clogs"
	}
	
	sets.idle.Town = {
	head = "Magnifying Specs.",
	neck = "Weaver's Torque",
	body = "Weaver's Smock",
	hands = "Weaver's Cuffs",
	feet="Herald's Gaiters"
	}
	
	--sets.latent_refresh = {waist="Fucho-no-Obi"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
		sets.buff['Divine Caress'] = {
		hands="Orison Mitts +2",
		back="Mending Cape"
	}
	
--Sample For Defending Ring
--DarkRing.physical = {name="Defending Ring",augments={"[1]Accuracy+9","[2]STR+4"}}
--DarkRing.physical2 = {name="Defending Ring",augments={"[1]Attack+12","[2]\"Mag.Atk.Bns\"+12","[3]STR+11"}}
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
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
