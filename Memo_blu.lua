------------------------------------------------------------------------------------------------------------------
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

	send_command('alias mab input /equip main "Nibiru Cudgel"; input /equip sub "Nibiru Cudgel";' )
	send_command('alias tp input /equip main "Almace"; input /equip sub "Sequence";' )

	send_command('alias trust input /ma "AAEV" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "Arciela" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
	send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
	send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
	send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
	send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
	send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')
	send_command('alias cel input /item "Rubicund Cell" <t>; input /item "Cobalt Cell" <t>; input /item "Phase Displacer" <t>;')
	send_command('alias dis input /item "Phase Displacer" <t>; ')
	send_command('alias atk input /attack <bt>; ')

	send_command('alias ibu input /item "Ibushi Shinai" <me>; ')
	send_command('alias key input /item "Forbidden Key" <t>; ')
	send_command('alias ech input /item "Echo Drops" <me>')
	send_command('alias holy input /item "Holy Water" <me>')
	send_command('alias rem input /item "Remedy" <me>') 

include('Memo-Include.lua')

state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
	state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
	state.Buff.Convergence = buffactive.Convergence or false
	state.Buff.Diffusion = buffactive.Diffusion or false
	state.Buff.Efflux = buffactive.Efflux or false
	
	state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false
	state.Buff['Unbridled Wisdom'] = buffactive['Unbridled Wisdom'] or false


	blue_magic_maps = {}
	
	-- Mappings for gear sets to use for various blue magic spells.
	-- While Str isn't listed for each, it's generally assumed as being at least
	-- moderately signficant, even for spells with other mods.
	
	-- Physical Spells --
	
	-- Physical spells with no particular (or known) stat mods
	blue_magic_maps.Physical = S{
		'Bilgestorm','Sweeping Gouge','Saurian Slide'
	}

	-- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
	blue_magic_maps.PhysicalAcc = S{
		'Heavy Strike'
	}

	-- Physical spells with Str stat mod
	blue_magic_maps.PhysicalStr = S{
		'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
		'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
		'Uppercut','Vertical Cleave'
	}
		
	-- Physical spells with Dex stat mod
	blue_magic_maps.PhysicalDex = S{
		'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
		'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
		'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
		'Vanity Dive'
	}
		
	-- Physical spells with Vit stat mod
	blue_magic_maps.PhysicalVit = S{
		'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
		'Power Attack','Quad. Continuum','Sprout Smack','Sub-zero Smash'
	}
		
	-- Physical spells with Agi stat mod
	blue_magic_maps.PhysicalAgi = S{
		'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
		'Pinecone Bomb','Spiral Spin','Wild Oats'
	}

	-- Physical spells with Int stat mod
	blue_magic_maps.PhysicalInt = S{
		'Mandibular Bite','Queasyshroom'
	}

	-- Physical spells with Mnd stat mod
	blue_magic_maps.PhysicalMnd = S{
		'Ram Charge','Screwdriver','Tourbillion'
	}

	-- Physical spells with Chr stat mod
	blue_magic_maps.PhysicalChr = S{
		'Bludgeon'
	}

	-- Physical spells with HP stat mod
	blue_magic_maps.PhysicalHP = S{
		'Final Sting'
	}

	-- Magical Spells --

	-- Magical spells with the typical Int mod
	blue_magic_maps.Magical = S{
		'Anvil Lightning','Atra. Libations','Blastbomb','Blazing Bound','Blinding Fulgor',
		'Bomb Toss','Cursed Sphere','Dark Orb','Death Ray','Diffusion Ray','Droning Whirlwind',
		'Embalming Earth','Entomb','Firespit','Foul Waters','Ice Break','Leafstorm','Maelstrom',
		'Molting Plumage','Nectarous Deluge','Rail Cannon','Regurgitation',
		'Rending Deluge','Retinal Glare','Scouring Spate','Searing Tempest','Silent Storm',
		'Spectral Floe','Subduction','Tem. Upheaval','Water Bomb',
		'Tearing Gust','Cesspool','Cruel Joke','Polar Roar','Crashing Thunder','Uproot'
	}

	-- Magical spells with a primary Mnd mod
	blue_magic_maps.MagicalMnd = S{
		'Acrid Stream','Evryone. Grudge','Magic Hammer','Mind Blast'
	}

	-- Magical spells with a primary Chr mod
	blue_magic_maps.MagicalChr = S{
		'Eyes On Me','Mysterious Light'
	}

	-- Magical spells with a Vit stat mod (on top of Int)
	blue_magic_maps.MagicalVit = S{
		'Thermal Pulse'
	}

	-- Magical spells with a Dex stat mod (on top of Int)
	blue_magic_maps.MagicalDex = S{
		'Charged Whisker','Gates of Hades'
	}

	-- Magical spells with a Dark elemental
	blue_magic_maps.MagicalDark = S{
		'Palling Salvo','Tenebral Crush'
	}
			
	-- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
	-- Add Int for damage where available, though.
	blue_magic_maps.MagicAccuracy = S{
		'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
		'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
		'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
		'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
		'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
		'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
		'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
		'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn'
	}
		
	-- Breath-based spells
	blue_magic_maps.Breath = S{
		'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
		'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
		'Thunder Breath','Vapor Spray','Wind Breath'
	}

	-- Stun spells
	blue_magic_maps.Stun = S{
		'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
		'Thunderbolt','Whirl of Rage'
	}
		
	-- Healing spells
	blue_magic_maps.Healing = S{
		'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
		'Wild Carrot'
	}
	
	-- Buffs that depend on blue magic skill
	blue_magic_maps.SkillBasedBuff = S{
		'Barrier Tusk','Diamondhide','Magic Barrier','Metallic Body','Plasma Charge',
		'Pyric Bulwark','Reactor Cool','Occultation'
	}

	-- Other general buffs
	blue_magic_maps.Buff = S{
		'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
		'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
		'Memento Mori','Nat. Meditation','Orcish Counterstance','Refueling',
		'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
		'Zephyr Mantle','Mighty Guard'
	}
	
	
	-- Spells that require Unbridled Learning to cast.
	unbridled_spells = S{
		'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
		'Cesspool','Crashing Thunder','Cruel Joke','Droning Whirlwind','Gates of Hades',
		'Harden Shell','Mighty Guard','Polar Roar','Pyric Bulwark','Tearing Gust',
		'Thunderbolt','Tourbillion','Uproot'
	}
	
    
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'Acc', 'Tank')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Normal', 'PDT', 'Learning')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')
	send_command('bind @1 input /ma "nat. meditation" <me>')
	send_command('bind @2 input /ma "erratic flutter" <me>')
	send_command('bind @3 input /ma "mighty guard" <me>')
	send_command('bind @4 input /ma "Occultation" <me>')
	send_command('bind @5 input /ma "barrier tusk" <me>')
	send_command('bind @6 input /ma "Carcharian Verve" <me>')
	send_command('bind @7 input /ja "Shield Bash" <t>')
	send_command('bind @8 input /ma "Regen IV" <t>')
	send_command('bind @9 input //exec thf/SA_Rudra.txt')
	send_command('bind @0 input //exec thf/SA_Mandalic.txt')
	send_command('bind @- input /ma "Devotion" <t>')
	send_command('bind @= input /ja "Divine Seal" <me>')

-- Misc CTRL	
	send_command('bind ^1 input /ja "Burst Affinity" <me>')
	send_command('bind ^2 input /ws "Savage Blade" <t>')
	send_command('bind ^3 input /ma "nat. meditation" <me>')
	send_command('bind ^4 input /ma "erratic flutter" <me>')
	send_command('bind ^5 input /ma "mighty guard" <me>')
	send_command('bind ^6 input /ma "Occultation" <me>')
	send_command('bind ^7 input /ma "barrier tusk" <me>')
	send_command('bind ^8 input /ma "Carcharian Verve" <me>')
	send_command('bind ^9 input /ja "spectral jig" <me>')
	send_command('bind ^0 input //exec thf/SA_Mandalic.txt')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')
	
-- Debuffs ALT
	send_command('bind !1 input /ma "Sudden Lunge" <t>')
	send_command('bind !2 input /ws "chant du cygne" <t>')
	send_command('bind !3 input /ws "Requiescat" <t>')
	send_command('bind !4 input /ws "sanguine blade" <t>')
	send_command('bind !5 input /ma "magic hammer" <t>')
	send_command('bind !6 input /ma "Occultation" <me>')
	send_command('bind !7 input /ma "barrier tusk" <me>')
	send_command('bind !8 input /ma "Carcharian Verve" <me>')
	send_command('bind !9 input /ja "chocobo jig II" <me>')
	send_command('bind !0 input //exec thf/TA_Mandalic.txt')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != input //gs c cycle OffenseMode')
	
-- 	Buffs CTRL

	send_command('bind @F1 input /ma "subduction" <t>')
	send_command('bind @F2 input /ma "Tenebral Crush" <t>')
	send_command('bind @F3 input /ma "Spectral floe" <t>')
	send_command('bind @F4 input /ma "dream flower" <t>')
	send_command('bind @F5 input /ma "Dia II" <t>')
	send_command('bind @F6 input /ma "Slow" <t>')
	send_command('bind @F7 input /ma "Paralyze" <t>')
	send_command('bind @F8 input /ma "Addle" <t>')
	send_command('bind @F9 input /ma "Silence" <t>')
	send_command('bind @F10 input /ma "Holy II" <t>')
	send_command('bind @F11 input /ma "Banish III" <t>')
	send_command('bind @F12 input /ja "Accession" <me>; input /echo --AOE--')

	send_command('bind ^F1 input /ma "subduction" <t>')
	send_command('bind ^F2 input /ma "glutinous dart" <t>')
	send_command('bind ^F3 input /ma "Tenebral Crush" <t>')
	send_command('bind ^F4 input /ja "feather step" <t>')
	send_command('bind ^F5 input /ja "animated flourish" <t>')
	send_command('bind ^F6 input /ja "no foot rise" <me>')
	send_command('bind ^F7 input /ja "steal" <t>')
	send_command('bind ^F8 input /ma "dream flower" <t>')
	send_command('bind ^F9 input /ja "bully" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input /ma "Banish III" <t>')
	send_command('bind ^F12 input /ja "Accession" <me>; input /echo --AOE--')
	
	send_command('bind !F1 input /ja "unbridled learning" <me>')
	send_command('bind !F2 input /ja "diffusion" <me>')
	send_command('bind !F3 input /ja "Curing Waltz III" <stpc>')
	send_command('bind !F4 input /ja "Curing Waltz IV" <stpc>')
	send_command('bind !F5 input /ma "magic fruit" <stpc>')
	send_command('bind !F6 input /ja "Healing Waltz" <stpc>')
	send_command('bind !F7 input /ja "Divine Waltz" <me>')
	send_command('bind !F8 input /ja "Divine Waltz II"  <me>')
	send_command('bind !F9 input /ma "Silence" <t>')
	send_command('bind !F10 input /ma "Holy II" <t>')
	send_command('bind !F11 input /ma "Banish III" <t>')
	send_command('bind !F12 input /ja "Accession" <me>; input /echo --AOE--')

    update_combat_form()

	
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience orb", 
	head="Carmine mask",neck="Baetyl Pendant",ear1="Enchanter earring +1",ear2="Etiolation Earring",
	body="Jhakri robe +2",hands="Leyline gloves",ring1="Prolix ring", ring2="Kishar ring",
	back="Swith cape +1",waist="Witful belt",legs="Ayanmo cosciales +2",feet="Jhakri pigaches +2" }
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {body="Hashishin mintan"})
   
	--sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

  --  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  --  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens"})
  --  sets.precast.FC.Curaga = sets.precast.FC.Cure
 --   sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs

    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
        
    sets.precast.WS['Chant du Cygne'] = {ammo="Jukukik feather",
        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Domin. Earring +1",ear2="Brutal earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Ilabrat Ring",ring2="Begrudging ring",
        back=gear.rosmertasCape_Crit,waist="Fotia Belt",legs=gear.herculeanTrousers_Crit,feet=gear.herculeanBoots_TA}
    
	sets.precast.WS['Requiescat'] = {ammo="Amar Cluster",
        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Domin. earring +1",ear2="Brutal Earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Rufescent ring",ring2="Epona's Ring",
        back=gear.rosmertasCape_WSD,waist="Fotia belt",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.precast.WS['Savage Blade'] = {ammo="Floestone",
        head=gear.herculeanHelm_MAB,neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Assimilator's jubbah +3",hands="Jhakri cuffs +2",ring1="Rufescent ring",ring2="Ifrit ring +1",
        back=gear.rosmertasCape_WSD,waist="Metalsinger Belt",legs=gear.herculeanTrousers_WSD,feet=gear.herculeanBoots_MAB}

	sets.precast.WS['Black Halo'] = {ammo="Floestone",
        head="Adhemar bonnet +1",neck="Caro necklace",ear1="Moonshade earring",ear2="Ishvara Earring",
        body="Assimilator's jubbah +3",hands="Jhakri cuffs +2",ring1="Rufescent ring",ring2="Ifrit ring +1",
        back=gear.rosmertasCape_WSD,waist="Metalsinger Belt",legs="Samnuha tights",feet="Jhakri pigaches +2"}
		
	sets.precast.WS['Expiacion'] = {ammo="Amar Cluster",
        head="Adhemar bonnet +1",neck="Fotia gorget",ear1="Domin. earring +1",ear2="Brutal Earring",
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Rufescent ring",ring2="Epona's Ring",
        back=gear.rosmertasCape_STP,waist="Fotia belt",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	

    -- Midcast Sets
    sets.midcast.FastRecast = set_combine(sets.precast.FC, {})
 	
	sets.midcast['Blue Magic'] = {}
	
	-- Physical Spells --
	
	sets.midcast['Blue Magic'].Physical = {ammo="Floestone",
		head="Jhakri coronal +2",neck="Sanctity necklace",ear1="Telos earring",ear2="Domin. Earring +1",
		body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Ifrit Ring +1",ring2="Rajas Ring",
		back=gear.rosmertasCape_STP,waist="Grunfeld rope",legs=gear.herculeanTrousers_Crit,feet="Jhakri pigaches +2"}

	sets.midcast['Blue Magic'].PhysicalAcc = {ammo="Amar Cluster",
		head="Jhakri coronal +2",neck="Sanctity necklace",ear1="Telos earring",ear2="Domin. Earring +1",
		body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Ifrit Ring +1",ring2="Rajas Ring",
		back=gear.rosmertasCape_STP,waist="Grunfeld rope",legs=gear.herculeanTrousers_Crit,feet="Jhakri pigaches +2"}

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
		{})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical)


	-- Magical Spells --
	
	sets.midcast['Blue Magic'].Magical =  { 
		ammo="Pemphredo tathlum", head="Jhakri coronal +2", neck="Sanctity necklace", ear1="Friomisi earring",ear2="Regal earring",
		body="Jhakri robe +2",hands="Jhakri cuffs +2",ring1="Strendu Ring",ring2="Shiva Ring +1",
		back="Cornflower cape",waist="Yamabuki-no-Obi",legs="Jhakri slops +2",feet="Jhakri pigaches +2"}

	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{ring2="Sangoma Ring"})
	
	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical)

	sets.midcast['Blue Magic'].MagicalDark = set_combine(sets.midcast['Blue Magic'].Magical, {head="Pixie Hairpin +1",ring2="Archon Ring"})

	sets.midcast['Blue Magic'].MagicAccuracy = set_combine(sets.midcast['Blue Magic'].Magical, {head="Jhakri coronal +2",ear1="Enchanter earring +1",ear2="Dignitary's earring", 
	waist="Eschan stone",ring2="Kishar ring",ring1="Etana Ring"})

	-- Breath Spells --
	
	sets.midcast['Blue Magic'].Breath = {}

	-- Other Types --
	
	sets.midcast['Blue Magic'].Stun = set_combine(sets.midcast['Blue Magic'].MagicAccuracy,
		{})

	sets.midcast['Blue Magic'].Healing = {ammo="Pemphredo tathlum",
		head="Telchine cap",neck="Incanter's torque",ear1="Regal earring",
		body="Assimilator's jubbah +3",hands="Telchine gloves",
		back="Solemnity cape",waist="Luminary sash",legs="Hashishin tayt +1",feet="Medium's sabots" }

	sets.midcast['Blue Magic'].SkillBasedBuff = {ammo="Pemphredo Tathlum",
		neck="Incanter's Torque", body="Assimilator's jubbah +3",
		hands="Assimilator's Bazubands +1",
		back="Cornflower Cape",legs="Hashishin tayt +1"}

	sets.midcast['Blue Magic'].Buff = {neck="Incanter's Torque"}
	
	sets.midcast['Healing Magic'] = set_combine(sets.midcast.FastRecast, {
		head=gear.telchineCap_ENH,neck="Incanter's torque",
		body="",hands=gear.telchineGloves_ENH, 
		back="Solemnity cape",wait="Luminary sash",legs=gear.telchineBraconi_ENH,feet="Medium's sabots"})

		    
    -- Sets to return to when not performing an action.
    sets.Learning = {ammo="Mavi Tathlum",
		neck="Incanter's Torque", body="Assimilator's jubbah +3",
		back="Cornflower Cape", hands="Assimilator's bazubands +1",legs="Hashishin tayt +1"}


    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {ammo="Staunch tathlum",
        head="Rawhide mask",neck="Loricate torque +1",ear1="Genmei earring",ear2="Etiolation earring",
        body="Jhakri robe +2",hands=gear.herculeanGloves_Refresh,ring1="Vocane Ring",ring2="Defending Ring",
        back="Solemnity cape",waist="Flume belt",legs="Carmine cuisses +1",feet=gear.herculeanBoots_Refresh}

	sets.idle.Learning = set_combine(sets.idle, sets.Learning)
 
    sets.Kiting = {legs="Carmine cuisses +1"}
	
	-- Engaged sets
	sets.engaged.STP = {ammo="Ginsen",
        head="Adhemar bonnet +1",neck="Asperity necklace",ear1="Telos earring",ear2="Brutal earring",	
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Petrov ring",ring2="Epona's ring",
        back=gear.rosmertasCape_STP,waist="Windbuffet belt +1",legs="Samnuha tights",feet=gear.herculeanBoots_TA}

	sets.engaged.Acc = {ammo="Amar Cluster",
        head="Adhemar bonnet +1",neck="Combatant's torque",ear1="Telos earring",ear2="Dignitary's earring",	
        body="Adhemar jacket +1",hands="Adhemar wristbands +1",ring1="Etana ring",ring2="Cacoethic ring +1",
        back=gear.rosmertasCape_STP,waist="Eschan stone",legs="Ayanmo cosciales +2",feet="Jhakri pigaches +2"}

	sets.engaged.Tank = {ammo="Staunch tathlum",
        head="Adhemar bonnet +1",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
		body="Ayanmo corazza +2",hands="Adhemar wristbands +1",ring1="Vocane ring",ring2="Defending Ring",
		back="Moonbeam cape",waist="Flume belt",legs="Ayanmo cosciales +2",feet=gear.herculeanBoots_TA}



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_precast(spell, action, spellMap, eventArgs)
	if unbridled_spells:contains(spell.english) and not (state.Buff['Unbridled Learning'] or state.Buff['Unbridled Wisdom']) then
		eventArgs.cancel = true
		windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
	end
	
	if spellMap == 'Cure' or spellMap == 'Curaga' then
		gear.default.obi_waist = "Ninurta's Sash"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	elseif spell.skill == 'Elemental Magic' or spell.skill == 'Dark Magic' or spell.skill == "Blue Magic" then
		gear.default.obi_waist = "Yamabuki-no-Obi"
		if spell.element == world.weather_element or spell.element == world.day_element then
			gear.default.obi_waist = "Hachirin-no-obi"
		end
	end
end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
	-- Add enhancement gear for Chain Affinity, etc.
	if spell.skill == 'Blue Magic' then
		for buff,active in pairs(state.Buff) do
			if active and sets.buff[buff] then
				equip(sets.buff[buff])
			end
		end
		if spellMap == 'Healing' and spell.target.type == 'SELF' and sets.self_healing then
			equip(sets.self_healing)
		end
	end

	-- If in learning mode, keep on gear intended to help with that, regardless of action.
	if state.OffenseMode.value == 'Learning' then
		equip(sets.Learning)
	end
end



-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
-- Return custom spellMap value that can override the default spell mapping.
-- Don't return anything to allow default spell mapping to be used.
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Blue Magic' then
		for category,spell_list in pairs(blue_magic_maps) do
			if spell_list:contains(spell.english) then
				return category
			end
		end
	end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if player.mpp < 51 then
		set_combine(idleSet, sets.latent_refresh)
	end
	return idleSet
end

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
	update_combat_form()
end

function update_combat_form()
	-- Check for H2H or single-wielding
	if player.equipment.sub == "Genbu's Shield" or player.equipment.sub == 'empty' then
		state.CombatForm:reset()
	else
		state.CombatForm:set('DW')
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
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 5)
end
