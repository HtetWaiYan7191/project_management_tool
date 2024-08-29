# frozen_string_literal: true

module PagesHelper
  def cards
    [{
      title: 'Annoucement',
      card_type: 'annoucement',
      description: 'Post Annoucement, pitch ideas and gather feedback while keeping discussions organized and on-topic',
      link: annoucements_path,
      svg: '<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" viewBox="0 0 47.5 47.5" width="100" height="100" enable-background="new 0 0 47.5 47.5" id="file">
                    <defs>
                        <clipPath id="a">
                            <path d="M0 38h38V0H0v38Z"></path>
                        </clipPath>
                    </defs>
                    <g clip-path="url(#a)" transform="matrix(1.25 0 0 -1.25 0 47.5)">
                        <path d="M0 0a4 4 0 0 1 4-4h24a4 4 0 0 1 4 4v17a4 4 0 0 1-4 4h-9c-3.562 0-3 5-8.437 5H4a4 4 0 0 1-4-4V0Z" transform="translate(1 8)" fill="#269" fill-opacity="1" fill-rule="nonzero" stroke="none"></path>
                        <path d="M0 0h-6.562C-12 0-11.438-5-15-5h-9a4 4 0 0 1-4-4v-10a1 1 0 1 0-2 0 4 4 0 0 1 4-4H0a4 4 0 0 1 4 4v15a4 4 0 0 1-4 4" transform="translate(31 27)" fill="#55acee" fill-opacity="1" fill-rule="nonzero" stroke="none"></path>
                    </g>
                </svg>'
    }, {
      title: 'Chat',
      card_type: 'chat',
      description: 'Chat casually with people, ask questions, connect with your team, and share news without ceremony',
      link: annoucements_path,
      svg: '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="none" viewBox="0 0 26 24" id="chat">
  <g filter="url(#a)">
    <path fill="#FF6B51" d="M5.46667 18.4972V13.4308C1.96822 13.2175 1.85401 10.6127 1.854 9.07467C1.854 8.5825 1.86156 7.52185 1.94689 4.36472C2.03222 1.20758 4.32614 0.898273 5.46667 0.898269H16.4526C20.9324 0.73828 19.8771 4.379 19.9876 8.66035C20.083 12.3589 18.5375 13.3146 16.383 13.3146L11.4396 13.4308C10.7463 14.1419 9.00778 16.0862 7.22656 17.8039C5.65198 19.3223 5.46667 19.0875 5.46667 18.4972Z"></path>
    <path stroke="#FF6B51" stroke-width=".15" d="M5.46667 18.4972V13.4308C1.96822 13.2175 1.85401 10.6127 1.854 9.07467C1.854 8.5825 1.86156 7.52185 1.94689 4.36472C2.03222 1.20758 4.32614 0.898273 5.46667 0.898269H16.4526C20.9324 0.73828 19.8771 4.379 19.9876 8.66035C20.083 12.3589 18.5375 13.3146 16.383 13.3146L11.4396 13.4308C10.7463 14.1419 9.00778 16.0862 7.22656 17.8039C5.65198 19.3223 5.46667 19.0875 5.46667 18.4972Z"></path>
  </g>
  <g filter="url(#b)">
    <path fill="#FF6B51" d="M14.0915 15.1159H11.3739L9.66345 16.7952H13.391L17.3562 20.6887C18.6004 21.83 19.0326 20.4036 19.0326 19.5908V16.7952H20.3442C23.3548 16.7952 24.095 14.4025 24.1454 12.7151C24.1958 11.0276 23.9917 5.85316 23.9464 5.20964C23.8478 3.80862 21.8268 3.4718 21.1231 3.4718V5.20964C22.5121 5.20964 22.4299 6.02107 22.4299 6.79635V12.3204C22.4299 14.6373 21.7697 15.1159 20.3442 15.1159H17.2697L17.3388 18.4323L14.0915 15.1159Z"></path>
    <path stroke="#FF6B51" stroke-width=".15" d="M14.0915 15.1159H11.3739L9.66345 16.7952H13.391L17.3562 20.6887C18.6004 21.83 19.0326 20.4036 19.0326 19.5908V16.7952H20.3442C23.3548 16.7952 24.095 14.4025 24.1454 12.7151C24.1958 11.0276 23.9917 5.85316 23.9464 5.20964C23.8478 3.80862 21.8268 3.4718 21.1231 3.4718V5.20964C22.5121 5.20964 22.4299 6.02107 22.4299 6.79635V12.3204C22.4299 14.6373 21.7697 15.1159 20.3442 15.1159H17.2697L17.3388 18.4323L14.0915 15.1159Z"></path>
  </g>
  <g filter="url(#c)">
    <circle cx="14.961" cy="7.042" r="1.275" fill="#FDDFDD"></circle>
    <circle cx="14.961" cy="7.042" r="1.2" stroke="#FDDFDD" stroke-width=".15"></circle>
  </g>
  <g filter="url(#d)">
    <circle cx="6.916" cy="7.042" r="1.275" fill="#FDDFDD"></circle>
    <circle cx="6.916" cy="7.042" r="1.2" stroke="#FDDFDD" stroke-width=".15"></circle>
  </g>
  <g filter="url(#e)">
    <circle cx="10.921" cy="7.042" r="1.275" fill="#FDDFDD"></circle>
    <circle cx="10.921" cy="7.042" r="1.2" stroke="#FDDFDD" stroke-width=".15"></circle>
  </g>
  <defs>
    <filter id="a" width="20.318" height="20.208" x=".779" y=".818" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse">
      <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
      <feColorMatrix in="SourceAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"></feColorMatrix>
      <feOffset dy="1"></feOffset>
      <feGaussianBlur stdDeviation=".5"></feGaussianBlur>
      <feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
      <feBlend in2="BackgroundImageFix" result="effect1_dropShadow"></feBlend>
      <feBlend in="SourceGraphic" in2="effect1_dropShadow" result="shape"></feBlend>
    </filter>
    <filter id="b" width="16.748" height="19.793" x="8.48" y="3.397" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse">
      <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
      <feColorMatrix in="SourceAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"></feColorMatrix>
      <feOffset dy="1"></feOffset>
      <feGaussianBlur stdDeviation=".5"></feGaussianBlur>
      <feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
      <feBlend in2="BackgroundImageFix" result="effect1_dropShadow"></feBlend>
      <feBlend in="SourceGraphic" in2="effect1_dropShadow" result="shape"></feBlend>
    </filter>
    <filter id="c" width="4.551" height="4.551" x="12.685" y="5.767" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse">
      <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
      <feColorMatrix in="SourceAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"></feColorMatrix>
      <feOffset dy="1"></feOffset>
      <feGaussianBlur stdDeviation=".5"></feGaussianBlur>
      <feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
      <feBlend in2="BackgroundImageFix" result="effect1_dropShadow"></feBlend>
      <feBlend in="SourceGraphic" in2="effect1_dropShadow" result="shape"></feBlend>
    </filter>
    <filter id="d" width="4.551" height="4.551" x="4.64" y="5.767" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse">
      <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
      <feColorMatrix in="SourceAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"></feColorMatrix>
      <feOffset dy="1"></feOffset>
      <feGaussianBlur stdDeviation=".5"></feGaussianBlur>
      <feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
      <feBlend in2="BackgroundImageFix" result="effect1_dropShadow"></feBlend>
      <feBlend in="SourceGraphic" in2="effect1_dropShadow" result="shape"></feBlend>
    </filter>
    <filter id="e" width="4.551" height="4.551" x="8.645" y="5.767" color-interpolation-filters="sRGB" filterUnits="userSpaceOnUse">
      <feFlood flood-opacity="0" result="BackgroundImageFix"></feFlood>
      <feColorMatrix in="SourceAlpha" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"></feColorMatrix>
      <feOffset dy="1"></feOffset>
      <feGaussianBlur stdDeviation=".5"></feGaussianBlur>
      <feColorMatrix values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"></feColorMatrix>
      <feBlend in2="BackgroundImageFix" result="effect1_dropShadow"></feBlend>
      <feBlend in="SourceGraphic" in2="effect1_dropShadow" result="shape"></feBlend>
    </filter>
  </defs>
</svg>'

    }, {
      title: 'Doc & Files',
      card_type: 'doc_and_file',
      description: 'Centralized place to organized and share docs, spreadsheets, images and other files',
      link: annoucements_path,
      svg: '<svg id="SvgjsSvg1016" width="100" height="100" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.com/svgjs"><defs id="SvgjsDefs1017"></defs><g id="SvgjsG1018"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" width="100" height="100"><path fill="#a1eebd" d="M3.757 0C2.79 0 2.003.787 2.003 1.754V12.27c0 .967.787 1.751 1.754 1.751h4.515c.007 0 .012-.006.02-.007a3.254 3.254 0 0 0 2.982 1.963 3.254 3.254 0 0 0 3.25-3.25 3.254 3.254 0 0 0-2.021-3.004V4.27c0-.008-.007-.014-.008-.023a.246.246 0 0 0-.064-.176l-4-4c-.052-.05-.122-.063-.192-.06C8.23.01 8.222 0 8.212 0H3.757Zm0 .5h4.246v2.262c0 .959.781 1.738 1.74 1.738h2.26v5.066a3.187 3.187 0 0 0-.729-.09 3.254 3.254 0 0 0-3.25 3.25c0 .277.045.54.11.795H3.757a1.256 1.256 0 0 1-1.254-1.253V1.754C2.503 1.063 3.066.5 3.757.5Zm4.746.393L11.628 4H9.74a1.24 1.24 0 0 1-1.238-1.238V.892zm2.77 9.084a2.753 2.753 0 0 1 2.75 2.75 2.752 2.752 0 0 1-2.75 2.75 2.752 2.752 0 0 1-2.75-2.75 2.753 2.753 0 0 1 2.75-2.75zM11 11.23v1.245H9.755v.5H11v1.248h.5v-1.248h1.246v-.5h-1.246V11.23h-.5z" class="color231f20 svgShape"></path></svg></g></svg>'
    }]
  end
end
