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

send_command('alias ass input /as Dracosam' )

send_command('alias tank input /equip main "Epeolatry"; input /equip sub "Refined grip +1";' )
send_command('alias dps input /equip main "Lionheart"; input /equip sub "Bloodrain strap";' )


send_command('alias tp input /equip main "Lionheart"; input /equip sub "umbra strap"; input /equip ammo "ginsen"; input /equip head "herculean helm"; input /equip neck "combatant\'s torque"; input /equip ear1 "cessance earring"; input /equip ear2 "sherida earring"; input /equip body "herculean vest"; input /equip hands "herculean gloves"; input /equip ring1 "epona\'s ring"; input /equip ring2 "hetairoi ring"; input /equip back "Agema cape"; input /equip waist "flume belt +1"; input /equip legs "herculean trousers"; input /equip feet "herculean boots"; ')

send_command('alias trust input /ma "qultada" <me>; wait 7; input /ma "Apururu (UC)" <me>; wait 7; input /ma "Joachim" <me>; wait 7; input /ma "king of hearts" <me>; wait 7; input /ma "Selh\'teus" <me>;' )
send_command('alias warp input /equip ring2 "warp ring"; wait 10; input /item "Warp Ring" <me>; ')
send_command('alias holla input /equip ring2 "Dimensional ring (holla)"; wait 10; input /item "Dimensional ring (holla)" <me>; ')
send_command('alias dem input /equip ring2 "Dimensional ring (dem)"; wait 10; input /item "Dimensional ring (dem)" <me>; ')
send_command('alias mea input /equip ring2 "Dimensional ring (mea)"; wait 10; input /item "Dimensional ring (mea)" <me>; ')
send_command('alias capa input /equip ring2 "capacity ring"; wait 10; input /item "capacity ring" <me>; ')

send_command('alias ray input /ja "rayke" <t>; input /party --rayke--')
send_command('alias gam input /ja "gambit" <t>; input /party --gambit--')

	send_command('alias p5 input /ma "Protect IV" <t>')
	send_command('alias s5 input /ma "shell V" <t>')

send_command('alias aqu input /ma "aquaveil" <me>')
send_command('alias ech input /item "Echo Drops" <me>')
send_command('alias holy input /item "Holy Water" <me>')
send_command('alias rem input /item "Remedy" <me>')
send_command('alias revit input /item "Super Revitalizer" <me>')
send_command('alias pot1 input /item "Lucid Potion I" <me>')
send_command('alias pot2 input /item "Lucid Potion II" <me>')
send_command('alias pot3 input /item "Lucid Potion III" <me>') 
send_command('alias eli1 input /item "Lucid Elixir I" <me>')
send_command('alias eli2 input /item "Lucid Elixir II" <me>')
send_command('alias eli3 input /item "Lucid Elixir III" <me>')      
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()

	state.OffenseMode:options('STP', 'Acc',  'Tank')
    --state.CastingMode:options('Normal', 'Resistant')
	state.IdleMode:options('Idle', 'PDT', 'MDT', 'Refresh')
	--state.EngagedMode:options('Haste', 'Acc', 'PDT')

	send_command('bind @1 input /ja "Defender" <me>')
	send_command('bind @2 input /ja "Swordplay" <me>')
	send_command('bind @3 input /ja "embolden" <me>')
	send_command('bind @4 input /ja "One for all" <me>')
	send_command('bind @5 input /ja "Odyllic Subterfuge" <t>')
	send_command('bind @6 input /ja "swipe" <t>')
	send_command('bind @7 input /ja "rayke" <t>; input /party --rayke--')
	send_command('bind @8 input /ja "gambit" <t>; input /party --gambit--')
	send_command('bind @9 input /ma "Refresh" <t>')
	send_command('bind @0 input /ja "Battuta" <me>')
	send_command('bind @- input /ma "Devotion" <t>')
	send_command('bind @= input /ja "Divine Seal" <me>')

-- Misc CTRL	
	send_command('bind ^1 input /ja "Vivacious Pulse" <me>')
	send_command('bind ^2 input /ma "flash" <t>')
	send_command('bind ^3 input /ma "crusade" <me>')
	send_command('bind ^4 input /ma "phalanx" <me>')
	send_command('bind ^5 input /ma "foil" <me>')
	send_command('bind ^6 input /ma "ice spikes" <me>')
	send_command('bind ^7 input /ma "blink" <me>')
	send_command('bind ^8 input /ma "stoneskin" <me>')
	send_command('bind ^9 input /ma "temper" <me>')
	send_command('bind ^0 input //exec thf/SA_Mandalic.txt')
	send_command('bind ^- input /ma "Devotion" <t>')
	send_command('bind ^= input /ja "Divine Seal" <me>')
	
-- Debuffs ALT	
	send_command('bind !1 input /ja "Provoke" <t>')
	send_command('bind !2 input /ws "Resolution" <t>')
	send_command('bind !3 input /ws "Dimidiation" <t>')
	send_command('bind !4 input /ja "warcry" <me>')
	send_command('bind !5 input /ja "aggressor" <me>')
	send_command('bind !6 input /ja "haste" <me>')
	send_command('bind !7 input /ja "regen IV" <me>')
	send_command('bind !8 input /ma "refresh" <me>')
	send_command('bind !9 input /ja "spectral jig" <me>')
	send_command('bind !0 input //exec thf/TA_Mandalic.txt')
	send_command('bind !- input /ja "Divine Caress" <me>')
	send_command('bind != input //gs c cycle OffenseMode')
	
-- 	Buffs CTRL

	send_command('bind @F1 input /ja "ignis" <me>')
	send_command('bind @F2 input /ja "gelus" <me>')
	send_command('bind @F3 input /ja "flabra" <me>')
	send_command('bind @F4 input /ja "tellus" <me>')
	send_command('bind @F5 input /ja "sulpor" <me>')
	send_command('bind @F6 input /ja "unda" <me>')
	send_command('bind @F7 input /ja "lux" <me>')
	send_command('bind @F8 input /ja "tenebrae" <me>')
	send_command('bind @F9 input /ma "Silence" <t>')
	send_command('bind @F10 input /ma "Holy II" <t>')
	send_command('bind @F11 input /ma "Banish III" <t>')
	send_command('bind @F12 input /ja "Accession" <me>; input /echo --AOE--')

	send_command('bind ^F1 input /ja "vallation" <me>')
	send_command('bind ^F2 input /ja "pflug" <t>')
	send_command('bind ^F3 input /ja "valiance" <t>')
	send_command('bind ^F4 input /ja "liement" <t>')
	send_command('bind ^F5 input /ja "Battuta" <t>')
	send_command('bind ^F6 input /ja "mug" <t>')
	send_command('bind ^F7 input /ja "steal" <t>')
	send_command('bind ^F8 input /ja "despoil" <t>')
	send_command('bind ^F9 input /ja "bully" <t>')
	send_command('bind ^F10 input /ma "Holy II" <t>')
	send_command('bind ^F11 input //gs c cycle IdleMode')
	send_command('bind ^F12 input //gs c cycle OffenseMode')
	
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
	ammo="Sapience orb", 
	head=gear.herculeanHelm_refresh, 
	neck="Voltsurge torque",
	ear1="Enchanter earring +1", 
	ear2="Loquacious Earring",
	hands="Leyline gloves", 
	ring1="Prolix ring", 
	ring2="Kishar Ring",
	back="Perimede Cape",
	waist="Witful belt",
	legs="Ayanmo cosciales +1", 
	feet="Chelona Boots +1"
	}
        
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {head="Erilaz galea +1", legs="Futhark trousers +1", waist="Siegel Sash"})

    --sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {neck="Diemer gorget", ear1="Nourishing earring +1", body="Jumalik mail"})

  --  sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

  --  sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main="Tamaxchi",sub="Genbu's Shield",ammo="Impatiens"})
  --  sets.precast.FC.Curaga = sets.precast.FC.Cure
 --   sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.
    
    -- Precast sets to enhance JAs
   sets.precast.JA['Provoke'] = 
		{
			neck="Unmoving collar +1", ear1="Cryptic earring",ear2="Pluto's pearl",
			ring1="Eihwaz ring",ring2="Apeile ring",
			back="Mubvumbamiri mantle",	waist="Goading belt",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"
		}
		
	sets.precast.JA['Vallation'] = 
		{
			body="Runeist coat +1"
		}
		
	sets.precast.JA['Swordplay'] = 
		{
			hands="Futhark mitons +1"
		}
		
	sets.precast.JA['Swipe'] = --MAB gear here?
		{
			neck="Unmoving collar +1", ring1="Eihwaz ring",ring2="Apeile ring",
			back="Mubvumbamiri mantle",	waist="Goading belt",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"
		}
	
	sets.precast.JA['Lunge'] = --MAB gear here?
		{
			neck="Unmoving collar +1",ring1="Eihwaz ring",ring2="Apeile ring",
			back="Mubvumbamiri mantle",	waist="Goading belt",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"
		}
		
	sets.precast.JA['Pflug'] = 
		{
			feet="Runeist bottes +1"
		}
		
	sets.precast.JA['Valiance'] = 
		{
			body="Runeist coat +1"
		}
		
	sets.precast.JA['Embolden'] = 
		{
			back="Evasionist's cape"
		}
	
	sets.precast.JA['Vivacious Pulse'] = 
		{
			neck="Incanter's torque",
			head="Erilaz galea +1"
		}

	sets.precast.JA['Gambit'] = 
		{
			hands="Regal Gauntlets"
		}
		
	sets.precast.JA['Battuta'] = 
		{
			head="Futhark bandeau +1"
		}	
		
	sets.precast.JA['Rayke'] = 
		{
			feet="Futhark boots +1"
		}
		
	sets.precast.JA['One for All'] = {}
		
	sets.precast.JA['Elemental Sforzo'] = 
		{
			body="Futhark coat +2"
		}
		
	sets.precast.JA['Odyllic Subterfuge'] = {}
		
    -- Waltz set (chr and vit)
  --  sets.precast.Waltz = {}
    
    
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
   -- gear.default.weaponskill_neck = "Asperity Necklace"
    --gear.default.weaponskill_waist = ""
        
      
	sets.precast.WS['Resolution'] = {
		ammo="Seething bomblet +1",
        head=gear.herculeanHelm_TA,
		neck="Fotia gorget",
		ear1="Moonshade earring",
		ear2="cessance earring",
        body="Meghanada cuirie +1",
		hands="Meghanada gloves +1",
		ring1="Ifrit ring +1",
		ring2="Shukuyu ring",
        back="ogma\'s cape",
		waist="Fotia Belt",
		legs="Carmine cuisses +1",
		feet=gear.herculeanBoots_TA
		}
		
	sets.precast.WS['Ground Strike'] = {
		ammo="Mantoptera eye",
        head=gear.herculeanHelm_TA,
		neck="Fotia gorget",
		ear1="Odnowa earring +1",
		ear2="Ishvara Earring",
        body="Sulevia's platemail +1",
		hands="Meghanada gloves +1",
		ring1="Rufescent ring",
		ring2="Ifrit Ring",
        back="Rudianos's mantle",
		waist="Fotia Belt",
		legs=gear.valorousHose_WSD,
		feet="Sulevia's leggings +1"
		}
    
	
	sets.precast.WS['Dimidiation'] = {
		ammo="Jukukik feather",
        head=gear.herculeanHelm_Crit,
		neck="Fotia gorget",
		ear1="Sherida earring",
		ear2="Ishvara Earring",
        body="Adhemar jacket",
		hands="Meghanada gloves +1",
		ring1="Apate ring",
		ring2="ilabrat Ring",
        back="ogma\'s cape",
		waist="Fotia Belt",
		legs="Samnuha tights",
		feet=gear.herculeanBoots_TA
		}


    -- Midcast Sets
    
    sets.midcast.FastRecast = {ammo="Sapience orb",
		neck="Unmoving collar +1",ring1="Prolix Ring"}
   
	sets.midcast.Cure = set_combine(sets.midcast.FastRecast, {neck="Phalaina locket", back="Solemnity cape", hands="Weatherspoon cuffs +1"})
	
	sets.midcast.Phalanx = set_combine(sets.midcast.FastRecast, {head="Futhark bandeau +1", neck="Incanter's torque", ear1="Andoaa earring", 
	hands="Regal Gauntlets",legs="Futhark trousers +1", back="Evasionist's cape"})
	
	sets.midcast.Flash = set_combine (sets.midcast.FastRecast, {neck="Unmoving collar +1", ear1="Cryptic earring",ear2="Pluto's pearl",ring1="Eihwaz ring",ring2="Apeile ring",
			back="Mubvumbamiri mantle",	waist="Goading belt",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"})
			
	sets.midcast.Regen = set_combine(sets.midcast.FastRecast, {head="Runeist bandeau +1", hands="Regal Gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal Gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Crusade = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal Gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Foil = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal Gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Temper = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal Gauntlets",legs="Futhark trousers +1"})
	
	sets.midcast.Refresh = set_combine(sets.midcast.FastRecast, {head="Erilaz galea +1", hands="Regal Gauntlets",legs="Futhark trousers +1"})
	
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    
    -- Idle sets
    sets.idle = {
		ammo="Homiliary",
        head=gear.herculeanHelm_refresh,
		neck="Loricate torque +1",
		ear1="Genmei earring",
		ear2="Odnowa earring +1",
        body="Futhark coat +2",
		hands="Regal Gauntlets",
		ring1="warden's Ring",
		ring2="Defending Ring",
        back="mecistopins mantle",
		waist="Flume belt +1",
		legs="Carmine cuisses +1",
		feet="Erilaz greaves +1"
		}

    sets.idle.PDT = {ammo="Staunch tathlum",
        head="Futhark bandeau +1",neck="Loricate torque +1",ear1="Genmei earring",ear2="Sherida Earring",
        body="Futhark coat +2",hands="Regal Gauntlets",ring1="Warden's ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"}

	sets.idle.MDT = {ammo="Staunch tathlum",
        head="Sulevia's mask +1",neck="Loricate torque +1",ear1="Etiolation Earring",ear2="Odnowa earring +1",
        body="Reverence surcoat +1",hands="Sulevia's gauntlets +1",ring1="Vocane Ring",ring2="Defending Ring",
        back="Mubvumbamiri mantle",waist="Asklepian belt",legs="Sulevia's cuisses +1",feet="Caballarius leggings +1"}

	sets.idle.Refresh = {ammo="Homiliary",
        head="Ogier's helm",neck="Creed collar",ear1="Ethereal Earring",ear2="Odnowa earring +1",
        body="Twilight mail",hands="Ogier's gauntlets",ring1="Vocane Ring",ring2="Defending Ring",
        back="Shadow Mantle",waist="Nierenschutz",legs="Ogier's breeches",feet="Ogier's leggings"}    
    
    -- Defense sets

    --sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Gendewitha Caubeen",neck="Loricate Torque +1",
      --  body="Gendewitha Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
      --  back="Umbra Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    --sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
     --   head="Nahtirah Hat",neck="Loricate Torque +1",
     --   body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
     --   back="Tuilha Cape",legs="Bokwus Slops",feet="Gendewitha Galoshes"}

    sets.Kiting = {legs="Carmine cuisses +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
   

	sets.engaged.STP = {
		ammo="Ginsen",
		head="Dampening Tam",
		neck="Asperity necklace",
		ear1="Sherida Earring",
		ear2="Brutal earring",
        body=gear.herculeanVest_TP,
		hands="Adhemar wristbands",
		ring1="Epona's ring",
		ring2="Petrov Ring",
        back="Lupine cape",
		waist="Windbuffet belt +1",
		legs=gear.herculeanTrousers_TP,
		feet=gear.herculeanBoots_TP
		}
		
	 sets.engaged.Acc = {ammo="Seething bomblet +1",
        head=gear.herculeanHelm_Crit,neck="Combatant's torque",ear1="Zennaroi earring",ear2="Telos earring",
        body="Meghanada cuirie +1",hands="Adhemar wristbands",ring1="Cacoethic ring +1",ring2="Cacoethic ring",
        back="Toutatis's cape",waist="Ioskeha belt",legs="Meghanada chausses",feet="Meghanada jambeaux +1"}

	sets.engaged.Tank = {ammo="Staunch tathlum",
        head="Futhark bandeau +1",neck="Loricate torque +1",ear1="Genmei earring",ear2="Sherida Earring",
        body="Futhark coat +2",hands="Regal Gauntlets",ring1="Warden's ring",ring2="Defending Ring",
        back="Moonbeam Cape",waist="Flume belt +1",legs="Erilaz leg guards +1",feet="Erilaz greaves +1"}
		
	



    -- Example of Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    --sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back="Mending Cape"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
--function job_precast(spell, action, spellMap, eventArgs)
--    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
--        eventArgs.handled = true
--   end
    
--    if spell.skill == 'Healing Magic' then
--       gear.default.obi_back = "Mending Cape"
--    else
--        gear.default.obi_back = "Toro Cape"
--    end
--end


--function job_post_midcast(spell, action, spellMap, eventArgs)
--    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
--    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
--        equip(sets.buff['Divine Caress'])
--    end
--end

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
--    set_macro_page(1, 7)
end
